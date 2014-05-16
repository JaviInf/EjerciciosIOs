//
//  Modelo.h
//  500Px
//
//  Created by iMac 9 on 07/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Foto.h"

@interface Modelo : NSObject
+ (Modelo *)sharedInstance;
-(Foto *) fotoAtIndex: (NSUInteger)index;
-(NSUInteger) numeroFotos;
@property (strong,nonatomic) NSMutableDictionary * fotos;
@property (strong,nonatomic) NSString *cacheDir;
@property (strong,nonatomic) NSString *fotosDir;
@end
