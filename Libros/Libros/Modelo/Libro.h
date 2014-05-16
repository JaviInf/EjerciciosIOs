//
//  Libro.h
//  Libros
//
//  Created by iMac 9 on 18/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Amigo, Autor;

@interface Libro : NSManagedObject

@property (nonatomic, retain) NSDate * fecha_de_prestamo;
@property (nonatomic, retain) NSString * isbn;
@property (nonatomic, retain) NSString * portada;
@property (nonatomic, retain) NSString * titulo;
@property (nonatomic, retain) Autor *autor;
@property (nonatomic, retain) Amigo *prestado_a;

@end
