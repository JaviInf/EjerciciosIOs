//
//  Modelo.m
//  Libros
//
//  Created by iMac 9 on 17/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Modelo.h"
#import "Libro+Metodos.h"



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
        _documento=[[UIManagedDocument alloc]initWithFileURL:[NSURL fileURLWithPath:[self.documentosPath stringByAppendingPathComponent:@"Libros"]]];
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
                    if (success){
                        [self cargaLibrosPorPrimeraVez];
                        //[self guardarDocumentoConCompletion:(usarDocumentoCompletion)];
                        for(NSDictionary* elemento in self.libros){
                           Libro *libro= [Libro crearLibroConTitulo:elemento[@"titulo"] portada:elemento[@""]  isbn:elemento[@"isbn"]  autor:elemento[@"autor"] contexto:self.documento.managedObjectContext];
                            libro.portada=[self guardarPortada:[UIImage imageNamed:elemento[@"portada"]] libro:libro];
                            
                        }
                        //[self cargaLibrosPorPrimeraVez];
                        //[self guardarDocumentoConCompletion:^(usarDocumentoCompletion)];
                        completion();}
                    else NSLog(@"Error al crear documento");
                }];
    }
}
                          
-(void)cargaLibrosPorPrimeraVez{
    NSString *bundlePath= [[NSBundle mainBundle]pathForResource:@"libracos" ofType:@"plist"];
    self.libros= [NSArray arrayWithContentsOfFile:bundlePath];
}

-(void) guardarDocumentoConCompletion:(usarDocumentoCompletion)completion
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
        [self cargaLibrosPorPrimeraVez];
       for(NSDictionary* elemento in self.libros){
            Libro *libro=[Libro crearLibroConTitulo:elemento[@"titulo"] portada:elemento[@"portada"]  isbn:elemento[@"isbn"]  autor:elemento[@"autor"] contexto:self.documento.managedObjectContext];
        }
    
        [self.documento saveToURL:self.documento.fileURL forSaveOperation:UIDocumentSaveForOverwriting
                completionHandler:^(BOOL success) {
                    if (success) completion();
                    else NSLog(@"Error al guardar documento");
                }];
    }
}
//llamar al hacer el properti lios

-(NSURL*)portadasURL{
    if(!_portadasURL){
        _portadasURL=[self.documento.fileURL URLByAppendingPathComponent:@"Portadas"];
        NSFileManager *fileManager=[NSFileManager defaultManager];
   
    if(![fileManager fileExistsAtPath:[_portadasURL path]]){
        NSError *error=nil;
        [fileManager createDirectoryAtURL:_portadasURL withIntermediateDirectories:YES attributes:nil error:&error];
       }
    }
    return _portadasURL;
}

-(NSString *)guardarPortada:(UIImage *)imagen libro:(Libro *)libro{
    NSData * data=UIImageJPEGRepresentation(imagen, 0.8);
   // NSURL * portadasUrl=[self.documento.fileURL URLByAppendingPathComponent:@"Portadas"];
       NSURL *archivoURL=[self.portadasURL URLByAppendingPathComponent:[NSString stringWithFormat:@"%@", libro.isbn]];
    [data writeToURL:archivoURL atomically:YES];
    return archivoURL.path;
}

@end
