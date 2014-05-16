//
//  Modelo.h
//  EjemploCoreData
//
//  Created by iMac 9 on 12/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Fotografo+Metodos.h"
#import "Foto+Metodos.h"

@interface Modelo : NSObject
@property (strong,nonatomic) NSString * documentosPath;
@property (strong,nonatomic) UIManagedDocument *documento;

+ (Modelo *)sharedInstance;

typedef void(^usarDocumentoCompletion)(void);
-(void) usarDocumentoConCompletion:(usarDocumentoCompletion)completion;

@end
