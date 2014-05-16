//
//  CalculadoraViewController.m
//  Calculadora
//
//  Created by iMac 9 on 13/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "CalculadoraViewController.h"
#import "Calculadora.h"

@interface CalculadoraViewController ()
@property(weak, nonatomic) IBOutlet UILabel *display;
@property (strong, nonatomic) Calculadora *calculadora;

@end

@implementation CalculadoraViewController

-(Calculadora *)calculadora{
    if(!_calculadora) _calculadora=[[Calculadora alloc]init];
    return _calculadora;
}

- (IBAction)pressDigito:(UIButton *)boton {
    [self.calculadora inputDigito:boton.currentTitle];
    self.display.text=[self.calculadora displayValor];
 }

- (IBAction)pressOperador:(UIButton *)boton {
    [self.calculadora inputOperador:boton.currentTitle];
    self.display.text=[self.calculadora displayValor];
    }

- (IBAction)pressIgual:(UIButton *)boton {
    [self.calculadora inputIgual];
    self.display.text=[self.calculadora displayValor];
}

- (IBAction)pressBorrar:(UIButton *)boton {
    [self.calculadora inputBorrar];
    self.display.text=[self.calculadora displayValor];
}
- (IBAction)pressPunto:(UIButton *)sender {
    [self.calculadora inputPunto];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   // self.calculadora=[[Calculadora alloc]init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
