//
//  Cervezas.m
//  Cervezas
//
//  Created by iMac 9 on 21/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "Cervezas.h"
#import "Cerveza.h"
#import "TablaViewController.h"

@interface Cervezas()

@property (strong, nonatomic) NSMutableArray *cervezas;
@property (strong, nonatomic) TablaViewController* tabla;

@end

@implementation Cervezas

+ (Cervezas *)sharedInstance
{
    static Cervezas *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Cervezas alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Obtener la lista de directorios que corresponden a mi búsqueda
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        // El path a Documentos es el primero (solo habrá un elemento en el array)
        NSString *docsDir = [paths objectAtIndex:0];
        // Y ahora añadir mi nombre de archivo al path de Documentos
        _path = [docsDir stringByAppendingPathComponent:@"birrasself.list"];
        // Comprobar si existe un archivo en ese path
        if([[NSFileManager defaultManager] fileExistsAtPath:_path]) {
            // Si existe, desarchivar
            self.arrayCervezas = [NSKeyedUnarchiver unarchiveObjectWithFile:_path];
            NSLog(@" Desarchivar _arrayCervezas %@",self.arrayCervezas);
            self.cervezas=self.arrayCervezas;
        }
       else{
           NSString *bundlePath= [[NSBundle mainBundle]pathForResource:@"beers" ofType:@"plist"];
          
           
           self.cervezas= [NSArray arrayWithContentsOfFile:bundlePath];
            NSUInteger cont=1;
            _arrayCervezas = [[NSMutableArray alloc] initWithCapacity:[self.cervezas count]];
           // _arrayFotos = [[NSMutableArray alloc] initWithCapacity:[self.cervezas count]];
            for(NSDictionary* elemento in self.cervezas){
                Cerveza *cerveza=[[Cerveza alloc]initWithId:cont nombre:elemento[@"name"] tipo:elemento[@"type"] foto:elemento[@"image"]];
                cont=cont+1;
                [_arrayCervezas addObject:cerveza];
                NSLog(@"arrayCervezas primer INIZIALICION %@",_arrayCervezas);
           //     [_arrayFotos addObject:cerveza.foto];
            }
            // Y archivar los datos para la próxima vez
            [self archivarDatos];
            self.numCervezas=cont;
        }
        _arrayFotos = [[NSMutableArray alloc] initWithCapacity:[self.cervezas count]];
        for(Cerveza* cerveza in self.arrayCervezas){
            [_arrayFotos addObject:cerveza.foto];
        }

        
   }
    
    return self;
}


- (void)cargaCervezas
{
   
    NSString *bundlePath= [[NSBundle mainBundle]pathForResource:@"beers" ofType:@"plist"];
    self.arrayCervezas= [NSArray arrayWithContentsOfFile:bundlePath];
    self.cervezas= [NSArray arrayWithContentsOfFile:bundlePath];
    
    NSLog(@"%@", self.cervezas);
}

-(void) guardarCerveza:(Cerveza *)cerveza{
    if(cerveza.id==0){//nueva cerveza
        cerveza.id = [self nuevoId];
        [self.arrayCervezas addObject:cerveza];
    }
    else {
        for (NSInteger i = 0; i != [self.arrayCervezas count]; i++) {
            Cerveza *otraCerveza = [self.arrayCervezas objectAtIndex:i];
            if(otraCerveza.id == cerveza.id) {
                [self.arrayCervezas setObject:cerveza atIndexedSubscript:i];
                break;
            }
        }
    }
    [self archivarDatos];
}

-(NSInteger)nuevoId
{
    NSInteger nuevoId = 0;
    for (Cerveza *otraCerveza in self.arrayCervezas) {
        if(otraCerveza.id > nuevoId) {
            nuevoId = otraCerveza.id;
        }
    }
    return nuevoId + 1;
}

- (void)archivarDatos
{
   // [_arrayCervezas writeToFile:_path atomically:YES];
    [NSKeyedArchiver archiveRootObject:self.arrayCervezas toFile:_path];
}

@end
