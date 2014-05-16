//
//  SeleccionaFotoViewController.m
//  Cervezas
//
//  Created by iMac 9 on 25/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "SeleccionaFotoViewController.h"
#import "Cervezas.h"
#import "AñadirViewController.h"
@interface SeleccionaFotoViewController ()
@property (strong, nonatomic) Cervezas *cervezas;
@property (strong, nonatomic) IBOutlet UIImageView *cajaImagenes;
@property (strong, nonatomic) IBOutlet UIPickerView *mipicker;
@property (strong,nonatomic) NSString *nuevaFoto;

@end

@implementation SeleccionaFotoViewController

- (IBAction)aceptarNuevaImagen:(UIBarButtonItem *)sender {
    //NSLog(@" nueva foto %@", self.nuevaFoto);
    [self.delegate guardarFotoCerveza:self.nuevaFoto];
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark dataSourcePicker methods

-(NSInteger) numberOfComponentsInPickerView: (UIPickerView *) pickerView{
    return 1;
}

-(NSInteger) pickerView: (UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.cervezas.arrayCervezas count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    Cerveza *cerveza=[self.arrayPicker objectAtIndex:row];
    return cerveza.nombre;
}

#pragma mark delegatePicker methods

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    self.cajaImagenes.image=[UIImage imageNamed:self.cervezas.arrayFotos[row]];
    _nuevaFoto=self.cervezas.arrayFotos[row];
    NSLog(@"parada");
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma mark inicializaciones

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cervezas=[Cervezas sharedInstance];
    self.arrayPicker=[[NSArray alloc]init];
    self.arrayPicker=self.cervezas.arrayCervezas;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
