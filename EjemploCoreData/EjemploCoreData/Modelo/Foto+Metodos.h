//
//  Foto+Metodos.h
//  EjemploCoreData
//
//  Created by iMac 9 on 12/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Foto.h"

@interface Foto (Metodos)
+(Foto *) crearFotoConDescripcion:(NSString *)descripcion
                       url_grande:(NSString *)url_grande
                         url_mini:(NSString *)url_mini
                            autor:(Fotografo *)fotografo
                         contexto:(NSManagedObjectContext *)contexto;
@end
