//
//  MaestroTableViewController.m
//  EjemploSplitView
//
//  Created by iMac 9 on 21/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "MaestroTableViewController.h"
#import "DetalleViewController.h"
#import "DetalleViewControllerDelegate.h"

@interface MaestroTableViewController () <UISplitViewControllerDelegate, UINavigationControllerDelegate>

@property (strong,nonatomic) UIBarButtonItem *botonSplitView;
@property (strong,nonatomic) UIPopoverController *popover;

@end

@implementation MaestroTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"MaestroViewController viewDidLoad");
}

-(void) awakeFromNib{
    NSLog(@"MaestroViewController awakeFromNiv");
    self.splitViewController.delegate=self;
    UINavigationController *detalleNav=self.splitViewController.viewControllers[1];
    detalleNav.delegate=self;
      }
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark UISplitViewControllerDelegate

-(BOOL)splitViewController:(UISplitViewController *)splitView shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation{
   // NSLog(@"No ocultar el master en ninguna orientacion");
    return UIInterfaceOrientationIsPortrait(orientation);
}
-(void)splitViewController:(UISplitViewController *)splitView willHideViewController:(UIViewController *)master withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popover{
    NSLog(@"Titulo Maestro: %@",self.title);
      NSLog(@"Titulo navigationItem: %@",self.navigationItem.title);
    barButtonItem.title=self.title;
    self.botonSplitView=barButtonItem;
    self.popover=popover;
    //Obtener referencia al detalle sdel splitView
    //que es un navigation controller
    UINavigationController *detalleNav=self.splitViewController.viewControllers[1];
    //Obtener referencia a la pnatlala visible en l navigtaion
   id <DetalleViewControllerDelegate> detalle= (id <DetalleViewControllerDelegate>)detalleNav.topViewController;
    NSLog(@"Detalle: %@",detalle);
    [detalle ponerBotonSplitVIew:self.botonSplitView];
}
-(void)splitViewController:(UISplitViewController *)splitView willShowViewController:(UIViewController *)master invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    self.botonSplitView=nil;
    self.popover=nil;
    //Obtener referencia al detalle sdel splitView
    //que es un navigation controller
    UINavigationController *detalleNav=self.splitViewController.viewControllers[1];
    //Obtener referencia a la pnatlala visible en l navigtaion
    id <DetalleViewControllerDelegate> detalle= (id <DetalleViewControllerDelegate>)detalleNav.topViewController;
    NSLog(@"Detalle: %@",detalle);
    [detalle quitarBotonSplitVIew:barButtonItem];


}

#pragma mark UINavigationControllerDelegate

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(self.botonSplitView){
        id <DetalleViewControllerDelegate> detalle= (id <DetalleViewControllerDelegate>)viewController;
        [detalle ponerBotonSplitVIew:self.botonSplitView];
    }
    else{
        id <DetalleViewControllerDelegate> detalle= (id <DetalleViewControllerDelegate>)viewController;
       [detalle quitarBotonSplitVIew:self.botonSplitView];
    }
}
@end
