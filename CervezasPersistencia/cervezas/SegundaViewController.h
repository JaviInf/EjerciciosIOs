//
//  SegundaViewController.h
//  Cervezas
//
//  Created by iMac 9 on 24/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cerveza.h"

@interface SegundaViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *nombre;
@property (strong, nonatomic) IBOutlet UILabel *tipo;
@property (strong, nonatomic) IBOutlet UIImageView *imagen;
@property (strong, nonatomic) Cerveza *cerveza;

@end
