//
//  AutorViewController.m
//  Libros
//
//  Created by iMac 9 on 17/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "AutorViewController.h"
#import "Modelo.h"
@interface AutorViewController () <NSFetchedResultsControllerDelegate>
@property (strong,nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) Modelo *modelo;
@property BOOL documentoAbierto;
@end

@implementation AutorViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
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
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Autor"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"nombre" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
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
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *celda = [self.tableView dequeueReusableCellWithIdentifier:@"CeldaAutor"];
    Autor *autor = [self.fetchedResultsController objectAtIndexPath:indexPath];
    celda.textLabel.text = autor.nombre;
    
    return celda;
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
