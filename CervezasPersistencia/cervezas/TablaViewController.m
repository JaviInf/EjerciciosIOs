//
//  TablaViewController.m
//  Cervezas
//
//  Created by iMac 9 on 21/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "TablaViewController.h"
#import "Cervezas.h"
#import "Cerveza.h"
#import "SegundaViewController.h"
#import "AñadirViewController.h"

@interface TablaViewController () 
@property (strong, nonatomic) Cervezas *cervezas;
@end

@implementation TablaViewController

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
    //Añadir boton edit en navegacion
    self.navigationItem.leftBarButtonItem=self.editButtonItem;
    self.cervezas=[Cervezas sharedInstance];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
  
    return [self.cervezas.arrayCervezas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Celda";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Cerveza * cerveza=[self.cervezas.arrayCervezas objectAtIndex:indexPath.row];
    cell.tag=cerveza.id;
    cell.textLabel.text = cerveza.nombre;
    cell.detailTextLabel.text=cerveza.tipo;
    cell.imageView.image=[UIImage imageNamed:cerveza.foto];

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
        if([segue.destinationViewController isKindOfClass:[SegundaViewController class]]){
            if([sender isKindOfClass:[UITableViewCell class]]){
                //NSLog(@"Segue detalle SegundaViewController");
                UITableViewCell *celda=sender;
                NSIndexPath *indexPath=[self.tableView indexPathForCell:celda];
                SegundaViewController *segundaViewController= segue.destinationViewController;
                Cerveza *cerveza=[self.cervezas.arrayCervezas objectAtIndex:indexPath.row];
                segundaViewController.cerveza=cerveza;
            }
        }
    }
    else if([[segue identifier] isEqualToString:@"añadir"])
    {
        if([segue.destinationViewController isKindOfClass:[An_adirViewController class]]){
           // NSLog(@"Segue añadir AñadirViewController");
            An_adirViewController *anadirViewController= segue.destinationViewController;
            Cerveza *cerveza=[[Cerveza alloc]init];
            anadirViewController.cerveza=cerveza;
            anadirViewController.delegate=self;
        }
    }
    else if([[segue identifier] isEqualToString:@"editar"])
    {
        if([segue.destinationViewController isKindOfClass:[An_adirViewController class]]){
           // NSLog(@"Segue edita AñadirViewContoller");
            UITableViewCell *celda=sender;
            NSIndexPath *indexPath=[self.tableView indexPathForCell:celda];
            An_adirViewController *anadirViewController= segue.destinationViewController;
            Cerveza *cerveza=[self.cervezas.arrayCervezas objectAtIndex:indexPath.row];
            anadirViewController.cerveza=cerveza;
            anadirViewController.delegate=self;
        }
    }
   

        // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

-(void)guardarCerveza:(Cerveza *)cerveza
{
    [self.cervezas guardarCerveza:cerveza];
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.tableView reloadData];
}

@end
