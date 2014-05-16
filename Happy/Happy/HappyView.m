//
//  HappyView.m
//  Happy
//
//  Created by iMac 14 on 27/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "HappyView.h"

@implementation HappyView

#pragma mark Constantes

#define ANCHO_LINEA 10
#define ANCHO_LINEA_OJO 6
#define ESCALA_CARA 0.9
#define FACTOR_DISTANCIA_OJO 0.4
#define FACTOR_RADIO_OJO 0.1
#define FACTOR_DISTANCIA_BOCA 0.4




#pragma mark View Life Cycle

- (void) awakeFromNib {
    [self setup];
}

- (void) setup{
    self.felicidad = 0.0;
    self.escala = 0.5;
    self.rotacion = 0.0;

}

- (void) setFelicidad:(CGFloat)felicidad{
    _felicidad = MIN(MAX(felicidad, -1.0), 1.0);
    [self setNeedsDisplay];
}


- (void) setEscala:(CGFloat)escala {
    _escala =   MAX(escala, 0.1);
    [self setNeedsDisplay];
}


- (void) setRotacion:(CGFloat)rotacion {
    _rotacion =  rotacion;
    [self setNeedsDisplay];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}





// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    
    // Calculo el centro del view
    CGFloat x = self.bounds.origin.x + self.bounds.size.width / 2;
    CGFloat y = self.bounds.origin.x + self.bounds.size.height / 2;
    CGFloat r = MIN(self.bounds.size.width / 2, self.bounds.size.height / 2) * self.escala;
    NSLog(@"x: %f \t y: %f \t r: %f", x, y, r);
    
    CGPoint centro = CGPointMake(x, y);
    
    XYRadio xyrCara = (XYRadio){x, y, r};
    
    NSLog(@"x: %f \t y: %f \t r: %f", xyrCara.x, xyrCara.y, xyrCara.radio);
    
    CGContextTranslateCTM(context, centro.x, centro.y);
    
    CGContextRotateCTM(context, self.rotacion);
    
    CGContextTranslateCTM(context, -centro.x, -centro.y);
    
    [self dibujarCaraEnXYRadio:xyrCara context:context];
    
    [self dibujarOjosEnXYRadio:xyrCara context:context];
    
    [self dibujarBocaEnXYRadio:xyrCara context:context];
    
}



- (void)dibujarCaraEnXYRadio:(XYRadio)xyrCara context:(CGContextRef)context
{
    // Guardar contexto en la pila
    UIGraphicsPushContext(context);
    
    CGContextSetLineWidth(context, ANCHO_LINEA);

    [[UIColor blackColor] setStroke];
    [[UIColor yellowColor] setFill];
    
    // Círculo
    CGContextAddArc(context, xyrCara.x, xyrCara.y, xyrCara.radio, 0, M_PI * 2, 0);
   
    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIGraphicsPopContext();
}



- (void) dibujarOjosEnXYRadio:(XYRadio)xyrCara context:(CGContextRef)context
{
    // Guardar contexto en la pila
    UIGraphicsPushContext(context);
    
    CGContextSetLineWidth(context, ANCHO_LINEA_OJO);
    [[UIColor whiteColor] setFill];

    // Ojo
    CGContextAddArc(context, xyrCara.x - xyrCara.radio * FACTOR_DISTANCIA_OJO, xyrCara.y - xyrCara.radio * FACTOR_DISTANCIA_OJO, xyrCara.radio  * FACTOR_RADIO_OJO, 0, M_PI * 2, 0);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    // Ojo
    CGContextAddArc(context, xyrCara.x + xyrCara.radio * FACTOR_DISTANCIA_OJO, xyrCara.y - xyrCara.radio * FACTOR_DISTANCIA_OJO, xyrCara.radio  * FACTOR_RADIO_OJO, 0, M_PI * 2, 0);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIGraphicsPopContext();
}



- (void) dibujarBocaEnXYRadio:(XYRadio)xyrCara context:(CGContextRef)context{
    
    UIGraphicsPushContext(context);
    
    CGPoint inicioBoca = CGPointMake(xyrCara.x - xyrCara.radio * FACTOR_DISTANCIA_BOCA,
                                     xyrCara.y + xyrCara.radio * FACTOR_DISTANCIA_BOCA);

    CGPoint finBoca = CGPointMake(xyrCara.x + xyrCara.radio * FACTOR_DISTANCIA_BOCA,
                                  xyrCara.y + xyrCara.radio * FACTOR_DISTANCIA_BOCA);
    
    CGFloat anchoBoca = finBoca.x - inicioBoca.x;
    
    CGPoint cp1 = CGPointMake(inicioBoca.x + anchoBoca * 1/4,inicioBoca.y + self.felicidad * anchoBoca / 2);
    CGPoint cp2 = CGPointMake(inicioBoca.x + anchoBoca * 3/4,inicioBoca.y +  self.felicidad * anchoBoca / 2);
    
    CGContextMoveToPoint(context, inicioBoca.x, inicioBoca.y);
    CGContextAddCurveToPoint(context, cp1.x, cp1.y, cp2.x, cp2.y, finBoca.x, finBoca.y);
    CGContextDrawPath(context, kCGPathStroke);
    UIGraphicsPopContext();
}



@end
