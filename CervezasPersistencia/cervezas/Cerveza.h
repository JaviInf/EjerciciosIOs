//
//  Cerveza.h
//  Cervezas
//
//  Created by iMac 9 on 21/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cerveza : NSObject <NSCoding>
@property  (nonatomic) NSUInteger id;
@property (strong, nonatomic) NSString *nombre;
@property (strong, nonatomic) NSString *tipo;
@property (strong, nonatomic) NSString *foto;

- (id)initWithId:(NSUInteger)iden
          nombre:(NSString *)nombre
            tipo:(NSString *)tipo
            foto:(NSString *)foto;

-(NSString *)description;

@end
