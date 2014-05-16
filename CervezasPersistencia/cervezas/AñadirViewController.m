//
//  AñadirViewController.m
//  Cervezas
//
//  Created by iMac 9 on 25/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "AñadirViewController.h"
#import "SegundaViewController.h"

@interface An_adirViewController ()
@property (strong, nonatomic) IBOutlet UITextField *cajaNombre;
@property (strong, nonatomic) IBOutlet UITextField *cajaTipo;
@property (strong, nonatomic) IBOutlet UITextField *cajaFoto;
@property (strong, nonatomic) IBOutlet UIImageView *foto;


@end

@implementation An_adirViewController
- (IBAction)pulsaGuardar:(UIBarButtonItem *)sender {
    self.cerveza.nombre=self.cajaNombre.text;
    self.cerveza.tipo=self.cajaTipo.text;
    //self.cerveza.foto=self.c
    
    [self.delegate guardarCerveza:self.cerveza];
}

-(void)guardarFotoCerveza:(NSString *)foto{
        self.cajaFoto.text=foto;
        self.foto.image=[UIImage imageNamed:foto];
        self.cerveza.foto=foto;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"añadirFoto"]) {
        NSLog(@"segue añadirFoto");
        SeleccionaFotoViewController *seleccionaFotoViewController = segue.destinationViewController;
        seleccionaFotoViewController.delegate = self;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.cajaNombre.text=self.cerveza.nombre;
    self.cajaTipo.text=self.cerveza.tipo;
    self.cajaFoto.text=self.cerveza.foto;
    self.foto.image=[UIImage imageNamed:self.cerveza.foto];
      
    
}

@end
