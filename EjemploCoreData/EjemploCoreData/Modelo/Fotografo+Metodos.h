//
//  Fotografo+Metodos.h
//  EjemploCoreData
//
//  Created by iMac 9 on 12/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Fotografo.h"

@interface Fotografo (Metodos)
+(Fotografo *) crearFotografoConNombre:(NSString *)nombre contexto:(NSManagedObjectContext *)contexto;
@end
