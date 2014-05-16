//
//  Libro+Metodos.h
//  Libros
//
//  Created by iMac 9 on 17/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Libro.h"


@interface Libro (Metodos)
+(Libro *) crearLibroConTitulo:(NSString *)titulo
                       portada:(NSString *)portada
                          isbn:(NSString *)isbn
                        autor:(NSString *)nombre
                      contexto:(NSManagedObjectContext *)contexto;



@end
