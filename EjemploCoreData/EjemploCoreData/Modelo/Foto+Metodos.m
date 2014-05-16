//
//  Foto+Metodos.m
//  EjemploCoreData
//
//  Created by iMac 9 on 12/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Foto+Metodos.h"

@implementation Foto (Metodos)
+(Foto *) crearFotoConDescripcion:(NSString *)descripcion
                       url_grande:(NSString *)url_grande
                         url_mini:(NSString *)url_mini
                            autor:(Fotografo *)fotografo
                         contexto:(NSManagedObjectContext *)contexto
{
    Foto * foto=[NSEntityDescription insertNewObjectForEntityForName:@"Foto" inManagedObjectContext:contexto];
    foto.descripcion=descripcion;
    foto.url_grande=url_grande;
    foto.url_mini=url_mini;
    foto.autor=fotografo;
    
    return foto;

}
@end
