//
//  Cerveza.m
//  Cervezas
//
//  Created by iMac 9 on 21/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Cerveza.h"

@interface Cerveza()
@end
@implementation Cerveza

- (id)initWithId:(NSUInteger)iden
          nombre:(NSString *)nombre
            tipo:(NSString *)tipo
            foto:(NSString *)foto
{
    self = [super init];
    if (self) {
        //inicializo objetos
        _id=iden;
        _nombre=nombre;
        _tipo=tipo;
        _foto=foto;
        // indicador para saber si es nueva o modificada
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%i %@", self.id, self.nombre];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.id = [aDecoder decodeIntegerForKey:@"id"];
        self.nombre = [aDecoder decodeObjectForKey:@"nombre"];
        self.tipo = [aDecoder decodeObjectForKey:@"tipo"];
        self.foto = [aDecoder decodeObjectForKey:@"foto"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.id forKey:@"id"];
    [aCoder encodeObject:self.nombre forKey:@"nombre"];
    [aCoder encodeObject:self.tipo forKey:@"tipo"];
    [aCoder encodeObject:self.foto forKey:@"foto"];
}

@end
