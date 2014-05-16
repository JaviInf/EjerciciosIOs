//
//  Autor+Metodos.h
//  Libros
//
//  Created by iMac 9 on 17/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Autor.h"
#import "Libro.h"

@interface Autor (Metodos)
+(Autor *) crearAutorConNombre:(NSString *)nombre
                      contexto:(NSManagedObjectContext*)contexto;
+(Autor *)buscarAutor:(NSString *)nombre
                crear:(BOOL)crear
             contexto:(NSManagedObjectContext *)contexto;
@end
