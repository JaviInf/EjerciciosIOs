//
//  ViewController.m
//  EjemploUnwind
//
//  Created by iMac 9 on 31/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

-(IBAction)cancelarModal:(UIStoryboardSegue*)segue{
    NSLog(@"Cancelar modal");
}

#pragma mark navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"prepare for segue: %@", segue.identifier);
}


@end
