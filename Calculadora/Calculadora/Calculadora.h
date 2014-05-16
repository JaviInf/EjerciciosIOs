//
//  Cuestionario.h
//  Calculadora
//
//  Created by iMac 9 on 13/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculadora : NSObject
-(NSString *)displayValor;

- (void) inputDigito:(NSString *)digito;

- (void) inputOperador:(NSString *)operador;

- (void) inputIgual;

- (void) inputBorrar;

-(void) inputPunto;

@end
