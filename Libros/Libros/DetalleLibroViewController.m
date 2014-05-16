//
//  DetalleLibroViewController.m
//  Libros
//
//  Created by iMac 9 on 18/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "DetalleLibroViewController.h"

@interface DetalleLibroViewController ()


@property (strong, nonatomic) IBOutlet UILabel *titulo;
@property (strong, nonatomic) IBOutlet UIImageView *portada;
@property (strong, nonatomic) IBOutlet UILabel *autor;
@property (strong, nonatomic) IBOutlet UILabel *prestadoA;
@property (strong, nonatomic) IBOutlet UILabel *fechaDePrestamo;
@property (strong,nonatomic) NSDateFormatter * ddMMyyyy;

@end

@implementation DetalleLibroViewController

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
    self.ddMMyyyy = [[NSDateFormatter alloc] init];
    [self.ddMMyyyy setDateFormat:@"dd/MM/yyyy"];

	// Do any additional setup after loading the view.
    self.titulo.text=self.libro.titulo;
     self.autor.text=self.libro.autor.nombre;
    self.fechaDePrestamo.text=[self.ddMMyyyy stringFromDate:self.libro.fecha_de_prestamo];
    // self.fechaDePrestamo.text=(NSString*)self.libro.fecha_de_prestamo;
     self.prestadoA.text=(NSString*)self.libro.prestado_a;
    //self.portada.image=[UIImage imageNamed:self.libro.portada];
    self.portada.image=[UIImage imageWithData:[NSData dataWithContentsOfFile:self.libro.portada]];
}



@end
