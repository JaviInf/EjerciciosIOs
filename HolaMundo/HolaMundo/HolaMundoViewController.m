//
//  HolaMundoViewController.m
//  HolaMundo
//
//  Created by iMac 9 on 12/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "HolaMundoViewController.h"

@interface HolaMundoViewController ()

@end

@implementation HolaMundoViewController

- (IBAction)accionHola:(id)sender {
    self.label.text=self.texto.text;
    [self.texto resignFirstResponder];
}

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

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.texto resignFirstResponder];
    self.label.text=self.texto.text;
    return YES;
}

@end
