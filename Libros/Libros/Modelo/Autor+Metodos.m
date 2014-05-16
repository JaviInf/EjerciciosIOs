//
//  Autor+Metodos.m
//  Libros
//
//  Created by iMac 9 on 17/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Autor+Metodos.h"
#import "Libro.h"

@implementation Autor (Metodos)
+(Autor *) crearAutorConNombre:(NSString *)nombre //NSString
                      contexto:(NSManagedObjectContext*)contexto
{
    Autor * autor=[NSEntityDescription insertNewObjectForEntityForName:@"Autor" inManagedObjectContext:contexto];
    autor.nombre=nombre;
    return autor;
}

+(Autor *)buscarAutor:(NSString *)nombre
                crear:(BOOL)crear
            contexto:(NSManagedObjectContext *)contexto{
    Autor *autor=nil;
    NSFetchRequest *request =[[NSFetchRequest alloc]initWithEntityName:@"Autor"];
    request.predicate=[NSPredicate predicateWithFormat:@"nombre= %@",nombre];
    NSError *error=nil;
    NSArray *autores=[contexto executeFetchRequest:request error:&error];
    if(autores){
        if([autores count]==1){
            autor=[autores firstObject];
        }
        else if([autores count]==0){
            if(crear) autor=[Autor crearAutorConNombre:nombre contexto:contexto];
        }
        
    }
    return autor;
}

@end
