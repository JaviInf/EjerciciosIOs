//
//  DetalleViewController.m
//  EjemploSplitView
//
//  Created by iMac 9 on 21/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "DetalleViewController.h"
#import "DetalleViewControllerDelegate.h"

@interface DetalleViewController () <DetalleViewControllerDelegate>

@end

@implementation DetalleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        NSLog(@"DetalleViewControllerviewDidLoad");
   // self.navigationItem.leftItemsSupplementBackButton=YES;
	// Do any additional setup after loading the view.
}

-(void) awakeFromNib{
    NSLog(@"DetalleViewController awakeFromNiv");
}

#pragma mark DetalleViewControllerDelegate
-(void)ponerBotonSplitVIew:(UIBarButtonItem *)botonSplitView{
    self.navigationItem.leftBarButtonItem=botonSplitView;
    
}

-(void)quitarBotonSplitVIew:(UIBarButtonItem *)botonSplitView{
        self.navigationItem.leftBarButtonItem=nil;
}
@end
