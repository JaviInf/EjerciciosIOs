//
//  FechaViewController.m
//  Fechas
//
//  Created by iMac 9 on 24/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "FechaViewController.h"

@interface FechaViewController ()
@property (strong,nonatomic) NSDateFormatter *ddmmyyyy;
@property (strong, nonatomic) IBOutlet UILabel *fechaLabel;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation FechaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.datePicker setDate:self.fecha];
}
- (IBAction)tocarCancelar:(UIBarButtonItem *)sender {
//    una modal puede quitarse a si misma de la pantalla pero lo adecuado es que la quite quien la haya puesto ahi
//   [self dismissViewControllerAnimated:YES completion:^{
//    }];
    [self.delegate cancelarFecha];
}
- (IBAction)cambiarFecha:(UIDatePicker *)sender {
    self.fecha=[sender date];
    self.fechaLabel.text=[self.ddmmyyyy stringFromDate:self.fecha];
    
}

- (IBAction)tocaAceptar:(UIButton *)sender {
  [self.delegate aceptarFecha:self.fecha];
}

-(NSDateFormatter *)ddmmyyyy{
    if(!_ddmmyyyy){
        _ddmmyyyy=[[NSDateFormatter alloc]init];
        _ddmmyyyy.timeStyle=NSDateFormatterNoStyle;
        _ddmmyyyy.dateFormat=@"dd/MM/yyy";
    }
    return _ddmmyyyy;
}


@end
