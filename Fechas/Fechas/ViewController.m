//
//  ViewController.m
//  Fechas
//
//  Created by iMac 9 on 24/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"
#import "FechaViewController.h"

@interface ViewController () <FechaViewControllerDelegate, UITextFieldDelegate>
@property (strong,nonatomic) NSDateFormatter *ddmmyyyy;
@property (strong, nonatomic) IBOutlet UITextField *fechaInicioText;
@property (strong, nonatomic) IBOutlet UITextField *fechaFinText;
@property (strong,nonatomic) UITextField *fechaText;
@property (strong, nonatomic) IBOutlet UIView *fechaSemiModal;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.fechaInicioText.text=@"01/01/2014";
    self.fechaFinText.text=@"31/12/2014";
    self.fechaInicioText.inputView=self.fechaSemiModal;
    self.fechaFinText.inputView=self.fechaSemiModal;


}

-(NSDateFormatter *)ddmmyyyy{
    if(!_ddmmyyyy){
        _ddmmyyyy=[[NSDateFormatter alloc]init];
        _ddmmyyyy.timeStyle=NSDateFormatterNoStyle;
        _ddmmyyyy.dateFormat=@"dd/MM/yyy";
    }
    return _ddmmyyyy;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark FechaViewControllerDelegate

-(void)aceptarFecha:(NSDate *)fecha{
    self.fechaText.text=[self.ddmmyyyy stringFromDate:fecha];
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
-(void)cancelarFecha{
       [self dismissViewControllerAnimated:YES completion:^{
    }];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.destinationViewController isKindOfClass:[FechaViewController class]]){
        FechaViewController *fechaViewController=segue.destinationViewController;
        if([segue.identifier isEqualToString:@"transicionFechaInicio"]){
            self.fechaText=self.fechaInicioText;
           fechaViewController.fecha=[self.ddmmyyyy dateFromString:self.fechaInicioText.text];
            fechaViewController.delegate=self;
            
            
        }
        if([segue.identifier isEqualToString:@"transicionFechaFin"]){
              self.fechaText=self.fechaFinText;
            fechaViewController.fecha=[self.ddmmyyyy dateFromString:self.fechaFinText.text];
            fechaViewController.delegate=self;
            
        }
        
    }
}

#pragma mark UItextFieldDelegate

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.fechaText=textField;
    self.datePicker.date=[self.ddmmyyyy dateFromString:self.fechaText.text];
    return YES;
}

- (IBAction)CancelarSemiModal1:(UIBarButtonItem *)sender {
       [self.fechaText endEditing:YES];
}

- (IBAction)aceptarSemiModal:(UIBarButtonItem *)sender {
    self.fechaText.text=[self.ddmmyyyy stringFromDate:self.datePicker.date];
    [self.fechaText endEditing:YES];

    
}

@end
