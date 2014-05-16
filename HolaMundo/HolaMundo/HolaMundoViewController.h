//
//  HolaMundoViewController.h
//  HolaMundo
//
//  Created by iMac 9 on 12/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HolaMundoViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UITextField *texto;
@property (strong, nonatomic) IBOutlet UIButton *boton;

@end
