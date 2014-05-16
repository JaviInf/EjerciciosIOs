//
//  Cervezas.h
//  Cervezas
//
//  Created by iMac 9 on 21/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cerveza.h"

@interface Cervezas : NSObject

@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSMutableArray *arrayCervezas;
@property (strong, nonatomic) NSMutableArray *arrayFotos;

@property  (nonatomic) int numCervezas;

-(void) cargaCervezas;
-(id) init;
-(void)guardarCerveza:(Cerveza *)cerveza;
+ (Cervezas *)sharedInstance;
@end
