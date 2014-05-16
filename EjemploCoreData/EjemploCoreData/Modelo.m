//
//  Modelo.m
//  EjemploCoreData
//
//  Created by iMac 9 on 12/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Modelo.h"

@implementation Modelo
#pragma mark Inicializacion
+ (Modelo *)sharedInstance
{
    static Modelo *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Modelo alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark getter$setters
-(UIManagedDocument *)documento{
    if(!_documento){
        _documento=[[UIManagedDocument alloc]initWithFileURL:[NSURL fileURLWithPath:[self.documentosPath stringByAppendingPathComponent:@"MiDocumento"]]];
        //NSLog(@"%@",  _documento.fileURL);
    
    }
    return _documento;
}

-(NSString *)documentosPath{
    if(!_documentosPath){
        _documentosPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        //NSLog(@"%@",_documentosPath);
    }
    return _documentosPath;
}


#pragma mark completion
-(void) usarDocumentoConCompletion:(usarDocumentoCompletion)completion
{
    //comprobar si existe el directorio de documentos
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self.documento.fileURL path]]) {
        [self.documento openWithCompletionHandler:^(BOOL success) {
            if (success) completion();
            else NSLog(@"Error al abrir documento");
        }];
    }
    else
    {
        [self.documento saveToURL:self.documento.fileURL forSaveOperation:UIDocumentSaveForCreating
                completionHandler:^(BOOL success) {
                    if (success) completion();
                    else NSLog(@"Error al crear documento");
                }];
    }
}
@end
