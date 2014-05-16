//
//  ViewController.m
//  EjemploI18N
//
//  Created by iMac 9 on 03/04/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSLog(@"Kjkjkljklj");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)tocarHola:(UIButton *)sender {

    NSLog(@"Hola %@", NSLocalizedStringFromTable(@"Hola", @"traduccion", @"Traduccion desde nslocalized"));
    //NSLocalizedStringFromTable(@"Hola", @"traduccion", @"Traduccion desde nslocalized");
    NSLocalizedString(@"Hola", @"");

}
- (IBAction)tocarAdios:(UIButton *)sender {
    NSLog(@"Noooooo");
}

@end
