//
//  ViewController.m
//  EjemploALerta
//
//  Created by iMac 9 on 31/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
@property (strong,nonatomic) UIAlertView* alerta;
@property (strong,nonatomic) UIAlertView* prompt;
@property (strong,nonatomic) UIAlertView* login;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)alerta:(UIBarButtonItem *)sender {
    self.alerta= [[UIAlertView alloc]initWithTitle:@"Alerta"
                                            message:@"Mensaje de alerta"
                                          delegate:self
                                 cancelButtonTitle:@"Cancelar"
                                 otherButtonTitles:@"Aceptar", nil];
    [self.alerta show];
}


- (IBAction)prompt1:(UIButton *)sender {
    self.prompt= [[UIAlertView alloc]initWithTitle:@"Prompt"
                                           message:@"Mensaje de alerta"
                                          delegate:self
                                 cancelButtonTitle:@"Cancelar"
                                 otherButtonTitles:@"Aceptar", nil];
    
    self.prompt.alertViewStyle= UIAlertViewStylePlainTextInput;
    [self.prompt textFieldAtIndex:0];
    [self.prompt show];

}
- (IBAction)login:(UIButton *)sender {
    self.login= [[UIAlertView alloc]initWithTitle:@"Login"
                                           message:@"Mensaje de Login"
                                          delegate:self
                                 cancelButtonTitle:@"Cancelar"
                                 otherButtonTitles:@"Aceptar", nil];
    
    self.login.alertViewStyle= UIAlertViewStyleSecureTextInput;
    [self.login show];

}

#pragma marl UIAñertViewDelegate

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    if ([alertView.title isEqual:@"Prompt"]) {
        NSLog(@"Lo detecto bin");
        UITextField *texto = [self.login textFieldAtIndex:0];
    }
    else if([alertView.title isEqualToString:@"Login"]){
               UITextField *login = [self.login textFieldAtIndex:0];

    }
    
    NSLog(@"%@", [self.alerta buttonTitleAtIndex:buttonIndex]);
    if(buttonIndex== self.alerta.cancelButtonIndex){
        NSLog(@"Cancelar %ld", (long)buttonIndex);
    }
}
@end
