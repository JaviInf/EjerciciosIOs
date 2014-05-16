//
//  Fotografo.h
//  EjemploCoreData
//
//  Created by iMac 9 on 12/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Foto;

@interface Fotografo : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSSet *fotos;
@end

@interface Fotografo (CoreDataGeneratedAccessors)

- (void)addFotosObject:(Foto *)value;
- (void)removeFotosObject:(Foto *)value;
- (void)addFotos:(NSSet *)values;
- (void)removeFotos:(NSSet *)values;

@end
