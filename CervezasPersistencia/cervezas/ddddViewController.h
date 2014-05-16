//
//  ddddViewController.h
//  Cervezas
//
//  Created by Javier Infante on 03/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ddddViewController : UIViewController

@end

- (id)init
{
    self = [super init];
    if (self) {
        // Obtener la lista de directorios que corresponden a mi búsqueda
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        // El path a Documentos es el primero (solo habrá un elemento en el array)
        NSString *docsDir = [paths objectAtIndex:0];
        // Y ahora añadir mi nombre de archivo al path de Documentos
        _path = [docsDir stringByAppendingPathComponent:@"Cervezas.list"];
        // Comprobar si existe un archivo en ese path
        if([[NSFileManager defaultManager] fileExistsAtPath:_path]) {
            // Si existe, desarchivar
            _cervezas = [NSKeyedUnarchiver unarchiveObjectWithFile:_path];
        } else {
            // Si no existe, leer del bundle
            NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"beers"
                                                                   ofType:@"plist"];
            NSArray *cervezas = [NSArray arrayWithContentsOfFile:bundlePath];
            _cervezas = [[NSMutableDictionary alloc] init];
            NSUInteger identificador = 0;
            for(NSDictionary *datos in cervezas) {
                Cerveza *cerveza =
                [[Cerveza alloc]
                 initWithIdentificador:identificador
                 nombre:[datos valueForKey:@"name"]
                 tipo:[datos valueForKey:@"type"]
                 foto:[datos valueForKey:@"image"]];
                [_cervezas setObject:cerveza forKey:[NSString stringWithFormat:@"%i", identificador]];
                identificador += 1;
            }//fin del for
            // Y archivar los datos para la próxima vez
            [self archivarDatos];
        }// finde del else
        // Por último, reconstruir el array de fotos a partir de las cervezas
        _fotos = [[NSMutableArray alloc] init];
        for(NSString *clave in _cervezas) {
            Cerveza *cerveza = [_cervezas valueForKey:clave];
            [_fotos addObject:cerveza.foto];
            if(![_fotos containsObject:cerveza.foto]) {
                [_fotos addObject:cerveza.foto];
            }
        }
    }
    return self;
}