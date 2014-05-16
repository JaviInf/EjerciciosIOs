//
//  tablaViewController.m
//  EjemploCoreData
//
//  Created by iMac 9 on 13/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "tablaViewController.h"
#import "Modelo.h"

@interface tablaViewController ()
@property (strong,nonatomic) Modelo *modelo;
@property (strong,nonatomic) NSArray *fotos;
@property BOOL documentoAbierto;
@property NSUInteger num;
@end

@implementation tablaViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)refrescarTabla{
    [self.tableView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.documentoAbierto=NO;
    self.modelo=[Modelo sharedInstance];
    [self.modelo usarDocumentoConCompletion:^{
        if(self.modelo.documento.documentState==UIDocumentStateNormal){
            NSLog(@"Documento creado correctamnte");
            self.documentoAbierto=YES;
            self.num=[self consultaLibros];
            [self refrescarTabla];
        }
    }];
   }


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(self.documentoAbierto)
    return 1;
    else return 0;
}

-(NSUInteger)consultaLibros{
    NSFetchRequest *consulta=[NSFetchRequest fetchRequestWithEntityName:@"Foto"];
    NSManagedObjectContext *moc = self.modelo.documento.managedObjectContext;
    NSError *error;
    self.fotos = [moc executeFetchRequest:consulta error:&error];
    if(self.fotos){
        for(Foto *foto in self.fotos){
            NSLog(@"Foto--------------##############-----------------");
            NSLog(@"Foto : %@", foto.descripcion);
        }
    }
    NSLog(@"numero de fotos %i", [self.fotos count]);
    return [self.fotos count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return self.num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Celda";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Foto *foto=[self.fotos objectAtIndex:indexPath.row];
    cell.textLabel.text=foto.descripcion;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
