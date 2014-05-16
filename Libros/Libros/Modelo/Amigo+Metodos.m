//
//  Amigo+Metodos.m
//  Libros
//
//  Created by iMac 9 on 17/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Amigo+Metodos.h"
#import "Libro.h"

@implementation Amigo (Metodos)
+(Amigo *) crearAmigoConNombre:(NSString *)nombre
                      telefono:(NSNumber *)telefono
                      contexto:(NSManagedObjectContext*)contexto
{
    Amigo * amigo=[NSEntityDescription insertNewObjectForEntityForName:@"Amigo" inManagedObjectContext:contexto];
    amigo.nombre=nombre;
    amigo.telefono=telefono;
    return amigo;
}


@end
