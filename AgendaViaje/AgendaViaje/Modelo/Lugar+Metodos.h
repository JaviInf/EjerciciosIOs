//
//  Lugar+Metodos.h
//  AgendaViaje
//
//  Created by iMac 9 on 26/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Lugar.h"

@interface Lugar (Metodos)
+(Lugar *) crearLugarConNombre:(NSString *)nombre
                          foto:(NSString *)foto
                      longitud:(NSNumber*)longitud
                       latitud:(NSNumber*)latitud
                           url:(NSString*)url
                      contexto:(NSManagedObjectContext*)contexto;

@end
