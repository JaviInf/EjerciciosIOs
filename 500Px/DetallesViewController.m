//
//  DetallesViewController.m
//  500Px
//
//  Created by iMac 9 on 10/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "DetallesViewController.h"
#import "Modelo.h"


@interface DetallesViewController ()
@property (strong, nonatomic) IBOutlet UILabel *descrip;
@property (strong, nonatomic) IBOutlet UIImageView *imagen;
@property (strong,nonatomic) Modelo *modelo;
@property  CGFloat escala;
@property  CGFloat ancho;
@property  CGFloat alto;
@property  CGFloat rotacion;
@property NSUInteger numFotos;
@property (strong, nonatomic) IBOutlet UIView *imageView;

@end

@implementation DetallesViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.ruletaNueva startAnimating];
    [self.foto descargaFotoConCalidad:@"5.jpg" completion:^(UIImage *image) {
        [self.ruletaNueva stopAnimating];
        self.imagen.image = image;
           // self.descrip.text=self.foto.descripcion;
    }];
    self.modelo=[Modelo sharedInstance];
    self.numFotos=[self.modelo numeroFotos];
    
    self.ancho=self.view.bounds.size.width;
    self.alto=self.view.bounds.size.height;
   }
- (IBAction)pinchFotoZoom:(UIPinchGestureRecognizer *)recognizer {
   if(recognizer.state == UIGestureRecognizerStateBegan) {
   // [recognizer setScale:self.escala];
  }
  if ((recognizer.state == UIGestureRecognizerStateChanged) ||
       (recognizer.state == UIGestureRecognizerStateEnded)) {
        self.escala=recognizer.scale;
        [self.imageView setTransform:[self transformacion]];
        //[recognizer setScale:self.escala];

    }
}

- (IBAction)tapFoto:(UITapGestureRecognizer *)recognizer {
   // [self.imageView setTransform:CGAffineTransformMakeScale(1, 1)];
    if(recognizer.state == UIGestureRecognizerStateRecognized) {
        [self resetTransformacion];
        [UIView animateWithDuration:1.0 animations:^{
            [self.imageView setTransform:[self transformacion]];
            [self.imageView setFrame:CGRectMake(0, 0, self.ancho, self.alto)];
        }];
    }


}
- (IBAction)rotarFoto:(UIRotationGestureRecognizer *)recognizer {
    if(recognizer.state == UIGestureRecognizerStateBegan) {
        [recognizer setRotation:self.rotacion];
    }
    if ((recognizer.state == UIGestureRecognizerStateChanged) ||
        (recognizer.state == UIGestureRecognizerStateEnded)) {
         self.rotacion=recognizer.rotation;
        [self.imageView setTransform:[self transformacion]];
        //[recognizer setRotation:self.rotacion];
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


- (IBAction)swipeAvanzar:(UISwipeGestureRecognizer *)sender {
    self.indiceActual+=1;
    if( self.indiceActual>=self.numFotos){
        self.indiceActual=0;
    }
    self.foto= [self.modelo fotoAtIndex:self.indiceActual];
    [self.foto descargaFotoConCalidad:@"5.jpg" completion:^(UIImage *image) {
        self.imagen.image = image;
        //self.descrip.text=self.foto.descripcion;
    }];

}
- (IBAction)swipeRetroceder:(UISwipeGestureRecognizer *)sender {
    if( self.indiceActual==0){
        self.indiceActual=self.numFotos-1;
    }
    else{
        self.indiceActual-=1;
    }
    self.foto= [self.modelo fotoAtIndex:self.indiceActual];
    [self.foto descargaFotoConCalidad:@"5.jpg" completion:^(UIImage *image) {
        self.imagen.image = image;
       // self.descrip.text=self.foto.descripcion;
    }];

}


@end
