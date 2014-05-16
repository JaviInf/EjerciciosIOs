//
//  ListadoViewController.m
//  AgendaViaje
//
//  Created by iMac 9 on 26/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ListadoViewController.h"
#import "DetalleViewController.h"
#import "AnadirViewController.h"


@interface ListadoViewController ()<NSFetchedResultsControllerDelegate>
@property (strong,nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) Modelo *modelo;
@property BOOL documentoAbierto;



@end

@implementation ListadoViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
       self.navigationItem.leftBarButtonItem = self.editButtonItem;
      self.documentoAbierto=NO;
    
    self.modelo=[Modelo sharedInstance];
    [self.modelo usarDocumentoConCompletion:^{
        if(self.modelo.documento.documentState==UIDocumentStateNormal){
            NSLog(@"Documento creado correctamnte");
              self.documentoAbierto=YES;
            [self setupFetchedResultsController];
        }
    }];

 }
- (void)setupFetchedResultsController
{
    NSLog(@"setupFetchedResultsController");
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Lugar"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"nombre" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.modelo.documento.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    NSError *error = nil;
    [self.fetchedResultsController performFetch:&error];
    if(error) NSLog(@"%@", error);
    [self.tableView reloadData];
    self.fetchedResultsController.delegate = self;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numero de ROws %lu", (unsigned long)[[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects]);
    return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *celda = [self.tableView dequeueReusableCellWithIdentifier:@"CeldaLugar"];
    Lugar *lugar = [self.fetchedResultsController objectAtIndexPath:indexPath];
    celda.textLabel.text = lugar.nombre;
       return celda;
}

#pragma mark Delegación y eventos NSFetchedResultsControllerDelegate

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Lugar *lugar=[self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.modelo.documento.managedObjectContext deleteObject:lugar];
      
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

-(void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:sectionIndex];
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}
-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    NSArray *objetoNuevo = nil;
    if(newIndexPath) objetoNuevo = [NSArray arrayWithObject:newIndexPath];
    NSArray *objetoViejo = nil;
    if(indexPath) objetoViejo = [NSArray arrayWithObject:indexPath];
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:objetoNuevo withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:objetoViejo withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate:
        {
            UITableViewCell *celda = [self.tableView cellForRowAtIndexPath:indexPath];
            Lugar *lugar = [self.fetchedResultsController objectAtIndexPath:indexPath];
            celda.textLabel.text = lugar.nombre;
            break;
        }
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:objetoViejo withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView insertRowsAtIndexPaths:objetoNuevo withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
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

#pragma mark segues
// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detalle"])
    {
        NSLog(@"segue de detalle a DeatlleViewController");
        if([segue.destinationViewController isKindOfClass:[DetalleViewController class]]){
            if([sender isKindOfClass:[UITableViewCell class]]){
                UITableViewCell *celda=sender;
                NSIndexPath *indexPath=[self.tableView indexPathForCell:celda];
                DetalleViewController *detalleViewController= segue.destinationViewController;
                Lugar *lugar=[self.fetchedResultsController objectAtIndexPath:indexPath];
                detalleViewController.lugar=lugar;
            }
        }
    }
    
    if ([[segue identifier] isEqualToString:@"anadir"])
    {
        NSLog(@"segue de anadir a AnadirViewController");
        if([segue.destinationViewController isKindOfClass:[AnadirViewController class]]){
            if([sender isKindOfClass:[UITableViewCell class]]){
                UITableViewCell *celda=sender;
                NSIndexPath *indexPath=[self.tableView indexPathForCell:celda];
                AnadirViewController *anadirViewController= segue.destinationViewController;
                Lugar *lugar=[Lugar crearLugarConNombre:@"" foto:@"" longitud:nil latitud:nil url:@"" contexto:self.modelo.documento.managedObjectContext];
                anadirViewController.lugar=lugar;
            }
        }
    }
    
    if ([[segue identifier] isEqualToString:@"edita"])
    {
        NSLog(@"segue de editar a AnadirViewController");
        if([segue.destinationViewController isKindOfClass:[AnadirViewController class]]){
            if([sender isKindOfClass:[UITableViewCell class]]){
                UITableViewCell *celda=sender;
                NSIndexPath *indexPath=[self.tableView indexPathForCell:celda];
                AnadirViewController *anadirViewController= segue.destinationViewController;
                Lugar *lugar=[self.fetchedResultsController objectAtIndexPath:indexPath];                anadirViewController.lugar=lugar;
            }
        }
    }


    

}


@end
