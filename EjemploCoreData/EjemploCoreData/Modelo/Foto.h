//
//  Foto.h
//  EjemploCoreData
//
//  Created by iMac 9 on 12/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Fotografo;

@interface Foto : NSManagedObject

@property (nonatomic, retain) NSString * descripcion;
@property (nonatomic, retain) NSString * url_mini;
@property (nonatomic, retain) NSString * url_grande;
@property (nonatomic, retain) Fotografo *autor;

@end
