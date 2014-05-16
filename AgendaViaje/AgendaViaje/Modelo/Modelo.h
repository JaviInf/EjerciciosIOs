//
//  Modelo.h
//  AgendaViaje
//
//  Created by iMac 9 on 26/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Lugar+Metodos.h"

@interface Modelo : NSObject

@property (strong,nonatomic) NSString * documentosPath;
@property (strong,nonatomic) UIManagedDocument *documento;
@property (strong,nonatomic) NSDictionary *lugares;

+ (Modelo *)sharedInstance;

typedef void(^usarDocumentoCompletion)(void);
-(void) usarDocumentoConCompletion:(usarDocumentoCompletion)completion;
@end
