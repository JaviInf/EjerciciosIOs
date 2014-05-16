//
//  Amigo+Metodos.h
//  Libros
//
//  Created by iMac 9 on 17/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Amigo.h"
#import "Libro.h"

@interface Amigo (Metodos)
+(Amigo *) crearAmigoConNombre:(NSString *)nombre
                      telefono:(NSNumber *)telefono
                      contexto:(NSManagedObjectContext*)contexto;


@end
