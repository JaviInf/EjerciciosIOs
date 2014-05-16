//
//  ViewController.m
//  EjemploCoreData
//
//  Created by iMac 9 on 12/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"
#import "Modelo.h"

@interface ViewController ()
@property (strong,nonatomic) Modelo * modelo;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.modelo=[Modelo sharedInstance];
   // NSLog(@"midocumento : %@",self.modelo.documento);
    
    [self.modelo usarDocumentoConCompletion:^{
        if(self.modelo.documento.documentState==UIDocumentStateNormal){
//            NSLog(@"Documento creado correctamnte");
//            Fotografo *fotografo1=[Fotografo crearFotografoConNombre:@"fotografo1" contexto:self.modelo.documento.managedObjectContext];
//            Foto *foto11=[Foto crearFotoConDescripcion:@"foto11" url_grande:@"" url_mini:@"" autor:fotografo1 contexto:self.modelo.documento.managedObjectContext];
//            Foto *foto12=[Foto crearFotoConDescripcion:@"foto12" url_grande:@"" url_mini:@"" autor:fotografo1 contexto:self.modelo.documento.managedObjectContext];
//            Foto *foto13=[Foto crearFotoConDescripcion:@"foto13" url_grande:@"" url_mini:@"" autor:fotografo1 contexto:self.modelo.documento.managedObjectContext];
//            
//            Fotografo *fotografo2=[Fotografo crearFotografoConNombre:@"fotografo2" contexto:self.modelo.documento.managedObjectContext];
//            Foto *foto21=[Foto crearFotoConDescripcion:@"foto21" url_grande:@"" url_mini:@"" autor:fotografo2 contexto:self.modelo.documento.managedObjectContext];
//            Foto *foto22=[Foto crearFotoConDescripcion:@"foto22" url_grande:@"" url_mini:@"" autor:fotografo2 contexto:self.modelo.documento.managedObjectContext];
//            Foto *foto23=[Foto crearFotoConDescripcion:@"foto23" url_grande:@"" url_mini:@"" autor:fotografo2 contexto:self.modelo.documento.managedObjectContext];
//            
//            NSFetchRequest *consulta=[NSFetchRequest fetchRequestWithEntityName:@"Fotografo"];
//            NSString *nombreFotografo = @"fotografo1";
//            consulta.predicate =
//            [NSPredicate predicateWithFormat:@"nombre = %@", nombreFotografo];
//            
//            NSManagedObjectContext *moc = self.modelo.documento.managedObjectContext;
//            NSError *error;
//            NSArray *fotografos = [moc executeFetchRequest:consulta error:&error];
//            if(fotografos){
//                for(Fotografo *fotografo in fotografos){
//                    NSLog(@"Fotografo-------------------##############-----------------");
//                    NSLog(@"Fotografo : %@", fotografo.nombre);
//                    for(Foto *foto in fotografo.fotos){
//                        NSLog(@"Foto--------------##############-----------------");
//                        NSLog(@"Foto : %@", foto.descripcion);
//                    }
//                }
//            }
          
            
            
        }
           }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
