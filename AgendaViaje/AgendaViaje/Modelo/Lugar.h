//
//  Lugar.h
//  AgendaViaje
//
//  Created by iMac 9 on 26/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Lugar : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * foto;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSNumber * latitud;
@property (nonatomic, retain) NSNumber * longitud;
@property (nonatomic, retain) NSDate * fechaVisita;

@end
