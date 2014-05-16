//
//  MasterViewController.h
//  EjemploMasterDetailIpad
//
//  Created by iMac 9 on 21/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
