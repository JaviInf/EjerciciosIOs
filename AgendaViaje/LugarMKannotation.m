//
//  LugarMKannotation.m
//  AgendaViaje
//
//  Created by iMac 9 on 27/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "LugarMKAnnotation.h"

@implementation LugarMKAnnotation

- (instancetype)initConCoordenadas:(CLLocationCoordinate2D)coordenadas
                            titulo:(NSString*)titulo
                         subtitulo:(NSString*)subtitulo
{
    self = [super init];
    if (self) {
        _coordinate=coordenadas;
        _title=titulo;
        _subtitle=subtitulo;
    }
    return self;
}
@end
