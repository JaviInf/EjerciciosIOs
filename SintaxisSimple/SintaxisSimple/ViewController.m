//
//  ViewController.m
//  SintaxisSimple
//
//  Created by iMac 9 on 19/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *textoSimpe=@"Esto es un texto";
    
    
    NSLog(@"%d", 2);
    // creacion antigua de un number
    NSLog(@"%@",[NSNumber numberWithInt:2]);
    NSLog(@"%@", @2);//[@2 description]
    
    NSLog(@"%@",[NSNumber numberWithFloat:2.2]);
    NSLog(@"%@", @2.2);//[@2 description]
    
    NSLog(@"%@", @(2+2));//[@2 description]
    
    NSNumber *x = @2;
    NSNumber *y = @(2 + 2); // El contenido es 4
    
    // he metido un 2 en x y saco un float
    NSLog(@"%f", [x floatValue]);
    NSLog(@"-----------NSnumber----------");
    NSNumber *numero = [NSNumber numberWithInt:20];
    NSLog(@"numero: %@", numero);
    NSNumber *numeroSimple = @20;
    NSLog(@"numeroSimple: %@", numeroSimple);
    NSNumber *numeroSumado = [NSNumber numberWithInt:20+2];
    NSLog(@"numeroSumado: %@", numeroSumado);
    NSNumber *numeroSimpleSumado = @(20+2);
    NSLog(@"numeroSimpleSumado: %@", numeroSimpleSumado);
    NSNumber *suma = [NSNumber numberWithInt:[numero intValue] + [numeroSimple intValue]];
    NSLog(@"suma: %@", suma);
    
    
    NSLog(@"------------arrays------------");
    NSArray *array = @[
                       @"Lunes",
                       @"Martes",
                       @"Miércoles",
                       @"Jueves",
                       @"Viernes",
                       @2,
                       @3
                       ];
    NSLog(@"array (%i): %@", [array count], array);
    NSLog(@"enumeración rápida array: ");
    
    //ejemplo de enumeracion rapida
    for (NSString *elemento in array) {
        NSLog(@"elemento: %@", elemento);
    }
    
    // enumeracion con introspreccion
    
    //los elementos de un array son de tipo id
    NSLog(@"enumeración con introspeccion: ");
    for(id elemento in array){
        //NSLog(@"elemento: %@", elemento);
        if([elemento isKindOfClass:[NSString class]]){// isMemberOfClass
            NSString *string=elemento;
            NSLog(@"Es un string: %@", string);
        }
        if([elemento isKindOfClass:[NSNumber class]]){
            NSNumber *numero=elemento;
            NSLog(@"Es un numero: %@", numero);
        }
    }
    
    
    NSLog(@"-----------NSDATE---------");
    NSDate *ahora = [NSDate dateWithTimeIntervalSinceNow:0];
    NSLog(@"%@", ahora);
    
    NSDateFormatter *ddmmyyyy = [[NSDateFormatter alloc] init];
    ddmmyyyy.timeStyle = NSDateFormatterNoStyle;
    ddmmyyyy.dateFormat = @"dd/MM/yyyy";
    NSDate *fecha = [ddmmyyyy dateFromString:@"02/04/2013"];
    NSLog(@"%@", [ddmmyyyy stringFromDate:fecha]);
    NSLog(@"%@", [ddmmyyyy stringFromDate:ahora]);
    NSLog(@"%@", fecha);
    
    NSLog(@"--------NSDictionary------");
    NSDictionary *diccionario = @{
                                  @"Nombre" : @"Fer",
                                  @"Apellido" : @"Alava",
                                  @"Edad" : @39
                                  };
    NSLog(@"%@", diccionario);
    NSLog(@"diccionario (%i): %@", [diccionario count], diccionario);
    NSLog(@"enumeración rápida diccionario: ");
    for (id clave in diccionario) {
        NSLog(@"%@ -> %@", clave, diccionario[clave]);
        //id valor = [diccionario objectForKey:clave];
        id valor = [diccionario valueForKey:clave];
        NSLog(@"elemento %@ => %@", clave, valor);
    }
    
    
    NSLog(@"--------NSSET------");
    NSSet *colores= [NSSet setWithArray:@[@"rojo", @"verde", @"azul"]];
    for(id elemento in colores){
        NSLog(@"Elemento : %@", elemento);
        
    }
    
    NSLog(@"-----------NSCOUNTED-------");
    NSCountedSet *colores2=[NSCountedSet setWithArray:@[@"rojo", @"verde", @"azul",@"rojo", @"verde", @"azul", @"verde", @"azul"]];
    for(id elemento in colores2){
        NSLog(@"Color: %@ y veces: %d", elemento,[colores2 countForObject:elemento]);
    }
}


@end
