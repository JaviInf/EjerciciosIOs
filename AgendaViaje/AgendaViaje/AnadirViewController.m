//
//  AnadirViewController.m
//  AgendaViaje
//
//  Created by iMac 9 on 27/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "AnadirViewController.h"
#import "Modelo.h"

@interface AnadirViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nombre;
@property (strong, nonatomic) IBOutlet UITextField *longitud;
@property (strong, nonatomic) IBOutlet UITextField *latitud;
@property (strong, nonatomic) IBOutlet UIImageView *imagen;
@property (strong, nonatomic) Modelo *modelo;

@end

@implementation AnadirViewController


- (void)viewDidLoad
{
    self.modelo=[Modelo sharedInstance];
 
    [super viewDidLoad];
    self.nombre.text=self.lugar.nombre;
    self.latitud.text=[self.lugar.latitud stringValue];
    self.longitud.text=[self.lugar.longitud stringValue];
    self.imagen.image=[UIImage imageNamed: self.lugar.foto];


}

- (IBAction)guardarLugar:(UIBarButtonItem *)sender {
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    if(self.lugar==nil){
        NSLog(@"Añadir nuevo");
        Lugar *lugarNuevo=[Lugar crearLugarConNombre:self.nombre.text foto:@"" longitud:[f numberFromString:self.longitud.text] latitud:[f numberFromString:self.longitud.text] url:@"" contexto:self.modelo.documento.managedObjectContext];
        NSLog(@"%@",lugarNuevo);
        self.lugar.nombre= lugarNuevo.nombre;
        self.lugar.longitud=lugarNuevo.longitud;
        self.lugar.latitud =lugarNuevo.latitud;
    }
    else{
    self.lugar.nombre= self.nombre.text;
    self.lugar.longitud=[f numberFromString:self.longitud.text];
        self.lugar.latitud =[f numberFromString:self.latitud.text];
    }
}

- (IBAction)ocultarTeclado:(UITextField *)sender {
    NSLog(@"Ocultar teclado");
}

@end
