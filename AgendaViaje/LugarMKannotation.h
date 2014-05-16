//
//  LugarMKannotation.h
//  AgendaViaje
//
//  Created by iMac 9 on 27/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LugarMKAnnotation : NSObject <MKAnnotation>
@property ( nonatomic) CLLocationCoordinate2D coordinate;
@property NSString* title;
@property NSString * subtitle;

- (instancetype)initConCoordenadas:(CLLocationCoordinate2D)coordenadas
                            titulo:(NSString*)titulo
                         subtitulo:(NSString*)subtitulo;

@end
