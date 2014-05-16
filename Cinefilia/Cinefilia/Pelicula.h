//
//  Pelicula.h
//  Cinefilia
//
//  Created by iMac 9 on 01/04/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pelicula : NSObject
@property (strong,nonatomic) NSString *titulo;
@property (strong,nonatomic) NSString* imdb_id;
@property (strong,nonatomic) NSString* imdb_url;

@property (strong,nonatomic) NSString* poster;
@property (strong,nonatomic) NSString* genero;
@property (strong,nonatomic) NSString* directores;
@property (strong,nonatomic) NSString* actores;
@property (strong,nonatomic) NSString* argumento;


- (id)initConDiccionario: (NSDictionary *)diccionario
         diccionarioPeli:(NSDictionary*)diccionarioPeli;


-(void) añadirInformacionAPeli:(NSDictionary*)diccionarioPeli;
    
@end


