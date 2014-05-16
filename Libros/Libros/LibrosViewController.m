//
//  LibrosViewController.m
//  Libros
//
//  Created by iMac 9 on 17/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "LibrosViewController.h"

#import "DetalleLibroViewController.h"
#import "AñadirLibroViewController.h"

@interface LibrosViewController () <NSFetchedResultsControllerDelegate>
@property (strong,nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) Modelo *modelo;
@property BOOL documentoAbierto;
@end

@implementation LibrosViewController

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


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)setupFetchedResultsController
{
    NSLog(@"setupFetchedResultsController");
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Libro"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"titulo" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.modelo.documento.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    NSError *error = nil;
    [self.fetchedResultsController performFetch:&error];
    if(error) NSLog(@"%@", error);
    [self.tableView reloadData];
     self.fetchedResultsController.delegate = self;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
     return [[self.fetchedResultsController sections] count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

   return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *celda = [self.tableView dequeueReusableCellWithIdentifier:@"CeldaLibro"];
    Libro *libro = [self.fetchedResultsController objectAtIndexPath:indexPath];
    celda.textLabel.text = libro.titulo;
    celda.detailTextLabel.text = libro.autor.nombre;
    celda.imageView.image=[UIImage imageWithData:[NSData dataWithContentsOfFile:libro.portada]];
    
    return celda;
}
#pragma mark - editButtonItem
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

#pragma mark Delegación y eventos NSFetchedResultsControllerDelegate

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Libro *libro=[self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.modelo.documento.managedObjectContext deleteObject:libro];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
            Libro *libro = [self.fetchedResultsController objectAtIndexPath:indexPath];
            celda.textLabel.text = libro.titulo;
            break;
        }
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:objetoViejo withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView insertRowsAtIndexPaths:objetoNuevo withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detalleLibro"])
    {
        NSLog(@"segue de detalleLibro a DeatlleLibroViewController");
        if([segue.destinationViewController isKindOfClass:[DetalleLibroViewController class]]){
            if([sender isKindOfClass:[UITableViewCell class]]){
                UITableViewCell *celda=sender;
                NSIndexPath *indexPath=[self.tableView indexPathForCell:celda];
                DetalleLibroViewController *detalleLibroViewController= segue.destinationViewController;
                Libro *libro=[self.fetchedResultsController objectAtIndexPath:indexPath];
               detalleLibroViewController.libro=libro;
            }
        }
    }

    if ([[segue identifier] isEqualToString:@"añadirLibro"])
    {
        NSLog(@"segue de añadirLibro a AñadirLibroViewController");

        if([segue.destinationViewController isKindOfClass:[An_adirLibroViewController class]]){
            if([sender isKindOfClass:[UITableViewCell class]]){
               // UITableViewCell *celda=sender;
               // NSIndexPath *indexPath=[self.tableView indexPathForCell:celda];
                An_adirLibroViewController *añadirLibroViewController= segue.destinationViewController;
                Libro *libro=nil;
              añadirLibroViewController.libro=libro;
            }
        }
    }

    if ([[segue identifier] isEqualToString:@"editarLibro"])
    {
        NSLog(@"segue de editarLibro a AñadirLibroViewController");

        if([segue.destinationViewController isKindOfClass:[An_adirLibroViewController class]]){
            if([sender isKindOfClass:[UITableViewCell class]]){
                UITableViewCell *celda=sender;
                NSIndexPath *indexPath=[self.tableView indexPathForCell:celda];
                An_adirLibroViewController *añadirLibroViewController= segue.destinationViewController;
                Libro *libro=[self.fetchedResultsController objectAtIndexPath:indexPath];
               añadirLibroViewController.libro=libro;
            }
        }
    }

   }


@end
