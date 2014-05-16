//
//  ViewController.m
//  Preferencias
//
//  Created by iMac 9 on 19/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSNumber *lanzamientos= [[NSUserDefaults standardUserDefaults]objectForKey:@"lanzamientos"];

if(!lanzamientos){
    [[NSUserDefaults standardUserDefaults]
     setObject:@1  forKey: @"lanzamientos"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
else {
    [[NSUserDefaults standardUserDefaults]
     setObject:@([lanzamientos integerValue]+1) forKey: @"lanzamientos"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
     NSLog(@"%@", lanzamientos);
     }

@end
