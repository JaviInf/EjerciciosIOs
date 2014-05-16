//
//  Modelo.m
//  500Px
//
//  Created by iMac 9 on 07/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Modelo.h"
#import "Foto.h"

@interface Modelo()


@end


@implementation Modelo

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

-(NSString *)cacheDir{
    if(!_cacheDir){
        _cacheDir=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSLog(@"_path%@",_cacheDir);
    }
    return _cacheDir;
    
}

-(NSString *)fotosDir{
    if(!_fotosDir){
        _fotosDir=[self.cacheDir stringByAppendingPathComponent:@"fotos"];
         NSLog(@"_path%@",_fotosDir);
    }
    return _fotosDir;

}

-(NSMutableDictionary *)fotos{
    if(!_fotos){
        _fotos=[[NSMutableDictionary alloc]init];
        NSDictionary *resultado=[self consulta500px:@"popular"];
        for (NSDictionary * diccionario in resultado[@"photos"]) {
            Foto *foto=[[Foto alloc]initConDiccionario:diccionario cache:self.cacheDir];
            [_fotos setObject:foto forKey:foto.identificador];
        }
    }
    return _fotos;
}

-(NSDictionary *)consulta500px:(NSString *)feature
{
     NSString *consulta= [NSString stringWithFormat:@"https://api.500px.com/v1/photos?%@&sort=created_at&image_size=3&include_store=store_download&include_states=voted&consumer_key=IeLCqqcX9NhYZBGZxw1rBb7KBjHjE93BPRHuaE5t",feature];
    NSURL *url = [NSURL URLWithString:consulta];
    NSData *datos = [NSData dataWithContentsOfURL:url];
    NSError *error = nil;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:datos options:NSJSONReadingMutableContainers error:&error];
    if(error) NSLog(@"error: %@", error);
    NSLog(@"resultado: %@", resultado);
    return resultado;
}

-(Foto *) fotoAtIndex: (NSUInteger)index{
    NSArray *keys=self.fotos.allKeys;
    //NSLog(@" array de keys %@",keys);
    return self.fotos[keys[index]];
}

-(NSUInteger) numeroFotos {
    return [self.fotos count];
}


@end
