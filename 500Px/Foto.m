//
//  Foto.m
//  500Px
//
//  Created by iMac 9 on 07/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Foto.h"

@implementation Foto

- (id)initConDiccionario: (NSDictionary *)diccionario cache:(NSString *)cacheDir
{
    self = [super init];
    if (self) {
        self.identificador=diccionario[@"id"];
        self.urlFoto= [diccionario[@"image_url"] stringByDeletingLastPathComponent];
        self.descripcion=diccionario[@"description"];
        self.cacheDir = [cacheDir stringByAppendingPathComponent:[self.identificador stringValue]];
        [self crearDirectorioCacheSiNoExiste];
        NSLog(@"%@",self.cacheDir);
    }
    return self;
}

-(void)crearDirectorioCacheSiNoExiste{
    NSFileManager *fileManager= [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:self.cacheDir]){
        NSError *error;
        [fileManager createDirectoryAtPath:self.cacheDir withIntermediateDirectories:YES attributes:nil error:&error];
        if(error)NSLog(@"%@",error);
    }
}
-(void) descargaFotoConCalidad:(NSString *)calidad completion:(descargarFotoCompletion)completion{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),^{
        NSString *fotoPath=[self.cacheDir stringByAppendingString:calidad];
        NSFileManager *fileManager=[NSFileManager defaultManager];
        NSURL *fotoUrl;
        BOOL guardar=NO;
        
        if([fileManager fileExistsAtPath:fotoPath]){
            NSLog(@"Desde cache: %@", self.identificador);
            fotoUrl=[NSURL fileURLWithPath:fotoPath];
        }
        else{
            NSLog(@"Desde internet: %@",self.identificador);
            fotoUrl=[NSURL URLWithString:[self.urlFoto stringByAppendingPathComponent:calidad]];
            guardar=YES;
        }
        // código lento...
        NSData *data=[NSData dataWithContentsOfURL:fotoUrl];
        
        if(guardar){
            [data writeToFile:fotoPath atomically:YES];
        }
        UIImage *image=[UIImage imageWithData:data];
        NSLog(@"imagen:  %@  ", image);
        // Revertir a la cola principal todo el código que toca UI
        dispatch_async(dispatch_get_main_queue(),^{
            // código UI
            completion(image);
        });
    });
}

@end
