//
//  Modelo.m
//  Cinefilia
//
//  Created by iMac 9 on 01/04/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Modelo.h"
#import "Pelicula.h"

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

-(NSMutableDictionary *)peliculas{
    if(!_peliculas){
        _peliculas=[[NSMutableDictionary alloc]init];
        _array_peliculas=[[NSMutableArray alloc]init];
        NSDictionary *resultado=[self consultaCartelera];
        for (NSDictionary * diccionario in resultado[@"peliculas"]) {
//            NSLog(@"peliculas imdb %@", diccionario[@"imdb_id"]);
             NSDictionary *informacionPeli= [self consultaImdbPelicula:diccionario[@"imdb_id"]];
            Pelicula *pelicula=[[Pelicula alloc]initConDiccionario:diccionario diccionarioPeli:informacionPeli];
            [_peliculas setObject:pelicula forKey:pelicula.imdb_id];
            [_array_peliculas addObject:pelicula];
            
            
        }
    }
    return _peliculas;
}




-(NSUInteger) numeroPeliculas {
    return [self.peliculas count];
}


-(NSDictionary *)consultaCartelera
{
    NSString *consulta= [NSString stringWithFormat:@"http://pixybit.es/api/cartelera.json"];
    NSURL *url = [NSURL URLWithString:consulta];
    NSData *datos = [NSData dataWithContentsOfURL:url];
    NSError *error = nil;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:datos options:NSJSONReadingMutableContainers error:&error];
    if(error) NSLog(@"error: %@", error);
//    NSLog(@"resultado: %@", resultado);
    return resultado;
}
-(NSDictionary *)consultaImdbPelicula: (NSString*)imdb_id
{
    NSString *consulta= [NSString stringWithFormat:@"http://www.omdbapi.com/?i=%@",imdb_id];
//    consulta=[NSString stringWithString:pelicula.imdb_id];
    NSURL *url = [NSURL URLWithString:consulta];
    NSData *datosPelicula = [NSData dataWithContentsOfURL:url];
    NSError *error = nil;
    NSDictionary *resultadoPelicula = [NSJSONSerialization JSONObjectWithData:datosPelicula options:NSJSONReadingMutableContainers error:&error];
    if(error) NSLog(@"error: %@", error);
//    NSLog(@"resultado: %@", resultadoPelicula);
    return resultadoPelicula;
}



@end
