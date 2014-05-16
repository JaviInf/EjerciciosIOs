//
//  Amigo.h
//  Libros
//
//  Created by iMac 9 on 18/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Libro;

@interface Amigo : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSNumber * telefono;
@property (nonatomic, retain) NSSet *libros;
@end

@interface Amigo (CoreDataGeneratedAccessors)

- (void)addLibrosObject:(Libro *)value;
- (void)removeLibrosObject:(Libro *)value;
- (void)addLibros:(NSSet *)values;
- (void)removeLibros:(NSSet *)values;

@end
