//
//  Libro+Metodos.m
//  Libros
//
//  Created by iMac 9 on 17/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Libro+Metodos.h"
#import "Autor+Metodos.h"


@implementation Libro (Metodos)

+(Libro *) crearLibroConTitulo:(NSString *)titulo
                       portada:(NSString *)portada
                         isbn:(NSString *)isbn
                        autor:(NSString *)nombre //NSstring

                         contexto:(NSManagedObjectContext *)contexto
{
    Autor *autor=[Autor buscarAutor:nombre
                              crear:YES
                           contexto:contexto];
    Libro * libro=[NSEntityDescription insertNewObjectForEntityForName:@"Libro" inManagedObjectContext:contexto];
    libro.titulo=titulo;
    libro.portada=portada;
    libro.isbn=isbn;
    libro.autor=autor;
    return libro;
}

@end
