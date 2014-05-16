//
//  CuestionarioViewController.m
//  Cuestionario
//
//  Created by iMac 9 on 13/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "CuestionarioViewController.h"

@interface CuestionarioViewController ()
@property (nonatomic, strong) NSArray *preguntas;
@property (nonatomic, strong) NSArray *respuestas;
@property (nonatomic) NSUInteger indice;
@end

@implementation CuestionarioViewController
- (IBAction)hazPregunta:(id)sender {
    
    [self.respuesta setText: [self.respuestas objectAtIndex:self.indice]];
    
        self.indice=self.indice+1;
    
    if(self.indice==3){
        self.indice=0;
    }

}

- (IBAction)sigPregunta:(id)sender {
    [self.pregunta setText: [self.preguntas objectAtIndex:self.indice]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.preguntas=@[@"¿Qué es iOS?",@"¿Qué es MVC?",@"¿Qué es Objective C?"];
    
    self.respuestas=@[@"Un superconjunto estricto de C",@"Model-View-Controller Modelo-Vista-Controlador",@"El Sistema Operativo de iPhone e iPad"];
    
    [self.pregunta setText:self.preguntas[0]];
     self.indice=0;
    
      NSLog(@"preguntas: %@", self.preguntas);
      NSLog(@"respuestas: %@", self.respuestas);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
