//
//  Modelo.h
//  Libros
//
//  Created by iMac 9 on 17/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Amigo+Metodos.h"
#import "Autor+Metodos.h"
#import "Libro+Metodos.h"

@interface Modelo : NSObject

@property (strong,nonatomic) NSString * documentosPath;
@property (strong,nonatomic) UIManagedDocument *documento;
@property (strong,nonatomic) NSArray *libros;
@property (strong,nonatomic) NSMutableArray *listalibros;
@property (strong,nonatomic) NSURL *portadasURL;

+ (Modelo *)sharedInstance;

typedef void(^usarDocumentoCompletion)(void);
-(void) usarDocumentoConCompletion:(usarDocumentoCompletion)completion;
-(void) guardarDocumentoConCompletion:(usarDocumentoCompletion)completion;

@end
