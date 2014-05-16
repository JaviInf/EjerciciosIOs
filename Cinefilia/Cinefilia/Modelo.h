//
//  Modelo.h
//  Cinefilia
//
//  Created by iMac 9 on 01/04/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Modelo : NSObject
@property (strong,nonatomic) NSMutableDictionary * peliculas;
@property (strong,nonatomic) NSMutableArray * array_peliculas;
@property (strong,nonatomic) NSString *cacheDir;
@property (strong,nonatomic) NSString *fotosDir;

+ (Modelo *)sharedInstance;
-(NSDictionary *)consultaCartelera;

-(NSUInteger) numeroPeliculas;
@end
