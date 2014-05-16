//
//  SegundaViewController.m
//  Cervezas
//
//  Created by iMac 9 on 24/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "SegundaViewController.h"

@interface SegundaViewController ()

@end

@implementation SegundaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.nombre.text=self.cerveza.nombre;
    self.tipo.text=self.cerveza.tipo;
    self.imagen.image=[UIImage imageNamed:self.cerveza.foto];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
