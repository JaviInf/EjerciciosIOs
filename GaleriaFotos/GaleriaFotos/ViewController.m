//
//  ViewController.m
//  GaleriaFotos
//
//  Created by iMac 9 on 03/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *foto;
@property (strong, nonatomic) IBOutlet UIImageView *fotoNueva;
@property NSInteger index;
@property (strong, nonatomic) NSArray *fotos;
@property CGFloat ancho;
@property CGFloat alto;
@property CGFloat rotacion;
@property CGFloat escala;


@end

@implementation ViewController

- (IBAction)retroceder:(UISwipeGestureRecognizer *)recognizer {
    NSLog(@"<--------swipe foto");
    [self actualizarFoto2];
    [self retrocederIndice];
    [self actualizarFoto];
    
    [self.fotoNueva setTransform:self.foto.transform];
    
    
    [self.foto setFrame:CGRectMake(-self.ancho, 0, self.ancho, self.alto)];
    [UIView animateWithDuration:1.0 animations:^{
        
        [self.foto setFrame:CGRectMake(0, 0, self.ancho, self.alto)];
        [self.fotoNueva setFrame:CGRectMake(self.ancho, 0, self.ancho, self.alto)];
    } completion:^(BOOL finished) {
        self.fotoNueva.hidden = YES;
    }];
    
}
- (IBAction)avanzar:(UISwipeGestureRecognizer *)recognizer {
    NSLog(@"swipe foto----->");
    [self actualizarFoto2];
    [self avanzarIndice];
    [self actualizarFoto];
    [self.fotoNueva setTransform:self.foto.transform];
    [self.foto setFrame:CGRectMake(self.ancho, 0, self.ancho, self.alto)];
    [UIView animateWithDuration:1.0 animations:^{
        
        [self.fotoNueva setFrame:CGRectMake(-self.ancho, 0, self.ancho, self.alto)];
        [self.foto setFrame:CGRectMake(0, 0, self.ancho, self.alto)];
    } completion:^(BOOL finished) {
        self.fotoNueva.hidden = YES;
    }];
}

- (IBAction)pinchFoto:(UIPinchGestureRecognizer *)recognizer {
    NSLog(@"pinch foto");
    if(recognizer.state == UIGestureRecognizerStateBegan) {
        [recognizer setScale:self.escala];
    }
    if ((recognizer.state == UIGestureRecognizerStateChanged) ||
        (recognizer.state == UIGestureRecognizerStateEnded)) {
        self.escala=recognizer.scale;
        [self.foto setTransform:self.transformacion];
        [recognizer setScale:self.escala];
    }
    
}
- (IBAction)tapFoto:(UITapGestureRecognizer *)recognizer {
       if(recognizer.state == UIGestureRecognizerStateRecognized) {
        [self resetTransformacion];
        [UIView animateWithDuration:1.0 animations:^{
            [self.foto setTransform:[self transformacion]];
            [self.foto setFrame:CGRectMake(0, 0, self.ancho, self.alto)];
        }];
    }
}

- (IBAction)rotarFoto:(UIRotationGestureRecognizer *)recognizer {
    NSLog(@"rotar foto");
    if(recognizer.state == UIGestureRecognizerStateBegan) {
        [recognizer setRotation:self.rotacion];
    }
    
    if ((recognizer.state == UIGestureRecognizerStateChanged) ||
        (recognizer.state == UIGestureRecognizerStateEnded)) {
        self.rotacion=recognizer.rotation;
        [self.foto setTransform:self.transformacion];
        [recognizer setRotation:self.rotacion];
    }
}

- (void)resetTransformacion {
    self.rotacion = 0.0;
    self.escala = 1.0;
}
- (CGAffineTransform)transformacion
{
    return CGAffineTransformRotate(CGAffineTransformMakeScale(self.escala, self.escala), self.rotacion);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.index=0;
    self.fotos=@[@"1.jpg", @"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg",@"8.jpg",@"9.jpg",@"10.jpg",@"11.jpg",@"12.jpg"];
    [self actualizarFoto];
    self.rotacion=0.0;
    self.escala=1.0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidLayoutSubviews{
    
    self.ancho=self.view.bounds.size.width;
    self.alto=self.view.bounds.size.height;
    NSLog(@"viewVillLayoputSubviews %f", self.ancho);
    NSLog(@"viewVillLayoputSubviews %f", self.alto);
    [self.foto setFrame:CGRectMake(0,0,self.ancho,self.alto)];
    [self.fotoNueva setFrame:CGRectMake(0,0,self.ancho,self.alto)];
    self.fotoNueva.hidden = YES;
    
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

-(void) actualizarFoto {
    self.foto.image=[UIImage imageNamed:self.fotos[self.index]];
    [self.foto setTransform:CGAffineTransformIdentity];
    [self.foto setFrame:CGRectMake(0, 0, self.ancho, self.alto)];
}

-(void) actualizarFoto2 {
    self.fotoNueva.image=[UIImage imageNamed:self.fotos[self.index]];
    [self.fotoNueva setTransform:CGAffineTransformIdentity];
    [self.fotoNueva setFrame:CGRectMake(0, 0, self.ancho, self.alto)];
    [self.fotoNueva setTransform:[self transformacion]];
    self.fotoNueva.hidden = NO;
    
}
- (BOOL)shouldAutorotate
{
    return YES;
}

-(void) avanzarIndice{
    self.index+=1;
    if(self.index>=[self.fotos count]){
        self.index=0;
    }
}

-(void) retrocederIndice{
    if(self.index==0){
        self.index=[self.fotos count]-1;
    }
    else{
        self.index -=1;
    }
}
@end
