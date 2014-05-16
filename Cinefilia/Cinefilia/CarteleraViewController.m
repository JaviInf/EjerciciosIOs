//
//  CarteleraViewController.m
//  Cinefilia
//
//  Created by iMac 9 on 01/04/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "CarteleraViewController.h"
#import "Modelo.h"
#import "Pelicula.h"
#import "DetalleViewController.h"
@interface CarteleraViewController ()
@property (strong,nonatomic) Modelo *modelo;
@end

@implementation CarteleraViewController

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
    
    self.modelo=[Modelo sharedInstance];
    [self.modelo peliculas];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
//    NSLog(@"Numero de peliculas %lu", (unsigned long)[self.modelo numeroPeliculas]);
    return [self.modelo numeroPeliculas];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CeldaPelicula";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
     Pelicula* pelicula=[self.modelo.array_peliculas  objectAtIndex:indexPath.row];
    cell.textLabel.text = pelicula.titulo;
    cell.imageView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:pelicula.poster]]];
    
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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detalle"])
    {
        NSLog(@"segue de detalle a DetalleViewController");
        if([segue.destinationViewController isKindOfClass:[DetalleViewController class]]){
            if([sender isKindOfClass:[UITableViewCell class]]){
                UITableViewCell *celda=sender;
                NSIndexPath *indexPath=[self.tableView indexPathForCell:celda];
                DetalleViewController *detalleViewController= segue.destinationViewController;
               Pelicula *pelicula=[self.modelo.array_peliculas objectAtIndex:indexPath.row];
                detalleViewController.pelicula=pelicula;                           }
        }
    }
}



@end
