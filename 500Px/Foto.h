//
//  Foto.h
//  500Px
//
//  Created by iMac 9 on 07/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Foto : NSObject
@property (strong, nonatomic) NSNumber * identificador;
@property (strong,nonatomic) NSString * urlFoto;
@property (strong,nonatomic) NSString *cacheDir;
@property (strong,nonatomic) NSString *descripcion;
-(id)initConDiccionario: (NSDictionary *)diccionario cache:(NSString *)cacheDir;

typedef void(^descargarFotoCompletion)(UIImage *image);
-(void) descargaFotoConCalidad:(NSString *)calidad completion:(descargarFotoCompletion)completion;

@end
