//
//  EditarViewController.m
//  EjemploSplitView
//
//  Created by iMac 9 on 21/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "EditarViewController.h"
#import "DetalleViewControllerDelegate.h"

@interface EditarViewController () <DetalleViewControllerDelegate>

@end

@implementation EditarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
     self.navigationItem.leftItemsSupplementBackButton=YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark DetalleViewControllerDelegate
-(void)ponerBotonSplitVIew:(UIBarButtonItem *)botonSplitView{
    self.navigationItem.leftBarButtonItem=botonSplitView;
    
}

-(void)quitarBotonSplitVIew:(UIBarButtonItem *)botonSplitView{
    self.navigationItem.leftBarButtonItem=nil;
}


@end
