//
//  Calculadora.m
//  Calculadora
//
//  Created by iMac 9 on 13/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Calculadora.h"

@interface Calculadora()
@property (strong,nonatomic) NSMutableString *display;
@property(strong,nonatomic) NSMutableString *operador;
@property(strong,nonatomic) NSString *operando1;
@property (nonatomic) BOOL ultimaEntradaEsOperador;
@end

@implementation Calculadora

-(NSMutableString *)display
{
    if(!_display) _display=[NSMutableString stringWithCapacity:20];
    return _display;
};

-(NSString *)displayValor
{
    if([self.display isEqualToString:@""]) return @"0";
    return self.display;
};

- (void) inputDigito:(NSString *)digito
{
    if(self.ultimaEntradaEsOperador){
         self.ultimaEntradaEsOperador=NO;
        self.operando1=[NSString stringWithString:self.display];
        [self.display setString:@""];
    }
    [self.display appendString:digito];
    
   
};

- (void) inputOperador:(NSString *)operador
{
    if(self.ultimaEntradaEsOperador)[self.display setString:@""];
    self.operador=operador;
    self.ultimaEntradaEsOperador=YES;
};

- (void) inputIgual
{
    if(self.operando1)
    {
        double operando1 = [self.operando1 doubleValue];
        
        if([self.operador isEqualToString:@"+"])
        {
            double operando2=[self.display doubleValue];
            [self.display setString:[NSString stringWithFormat:@"%g",operando1 + operando2]];
        }else if([self.operador isEqualToString:@"-"])
        {
            double operando2=[self.display doubleValue];
            [self.display setString:[NSString stringWithFormat:@"%g",operando1 - operando2]];
        }else if([self.operador isEqualToString:@"*"])
        {
            double operando2=[self.display doubleValue];
            [self.display setString:[NSString stringWithFormat:@"%g",operando1 * operando2]];
        }else if([self.operador isEqualToString:@"/"])
        {
            double operando2=[self.display doubleValue];
            [self.display setString:[NSString stringWithFormat:@"%g",operando1 / operando2]];
        };
        self.operando1=nil;
        self.operador=nil;
        
    };
};

- (void) inputBorrar
{
    [self.display setString:@""];
};

-(void) inputPunto
{
    NSLog(@"punto");
    [self.display appendString:@"."];
    
};

@end
