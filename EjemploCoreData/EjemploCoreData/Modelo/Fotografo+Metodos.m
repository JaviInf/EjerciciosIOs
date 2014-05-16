//
//  Fotografo+Metodos.m
//  EjemploCoreData
//
//  Created by iMac 9 on 12/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Fotografo+Metodos.h"

@implementation Fotografo (Metodos)
+(Fotografo *) crearFotografoConNombre:(NSString *)nombre
                              contexto:(NSManagedObjectContext *)contexto
{
    Fotografo * fotografo=[NSEntityDescription insertNewObjectForEntityForName:@"Fotografo" inManagedObjectContext:contexto];
    fotografo.nombre=nombre;
    
    return fotografo;
}
@end
