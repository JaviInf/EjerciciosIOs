//
//  Lugar+Metodos.m
//  AgendaViaje
//
//  Created by iMac 9 on 26/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Lugar+Metodos.h"

@implementation Lugar (Metodos)


+(Lugar *) crearLugarConNombre:(NSString *)nombre
                      foto:(NSString *)foto
                      longitud:(NSNumber*)longitud
                       latitud:(NSNumber*)latitud
                           url:(NSString*)url
                      contexto:(NSManagedObjectContext*)contexto
{
    Lugar* lugar=[NSEntityDescription insertNewObjectForEntityForName:@"Lugar" inManagedObjectContext:contexto];
    lugar.nombre=nombre;
    lugar.foto=foto;
    lugar.latitud=latitud;
    lugar.longitud=longitud;
    lugar.url=url;
    return lugar;
}

@end
