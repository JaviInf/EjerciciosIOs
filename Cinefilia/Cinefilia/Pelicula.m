//
//  Pelicula.m
//  Cinefilia
//
//  Created by iMac 9 on 01/04/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Pelicula.h"

@implementation Pelicula

- (id)initConDiccionario: (NSDictionary *)diccionario
         diccionarioPeli:(NSDictionary*)diccionarioPeli
{
    self = [super init];
    if (self) {
        self.titulo=diccionario[@"titulo"];
        self.imdb_id= diccionario[@"imdb_id"];
        self.imdb_url=diccionario[@"imdb_url"];
        self.poster=diccionarioPeli[@"Poster"];
        self.genero=diccionarioPeli[@"Genre"];
        self.argumento=diccionarioPeli[@"Plot"];
        self.directores=diccionarioPeli[@"Director"];
        self.actores=diccionarioPeli[@"Actors"];

    }
    return self;
}

-(void) añadirInformacionAPeli:(NSDictionary*)diccionarioPeli{
    self.poster=diccionarioPeli[@"Poster"];
    self.genero=diccionarioPeli[@"Genre"];
    self.argumento=diccionarioPeli[@"Plot"];
    self.directores=diccionarioPeli[@"Director"];
    self.actores=diccionarioPeli[@"Actors"];
}


@end

