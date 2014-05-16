//
//  ViewController.m
//  PropertyList
//
//  Created by iMac 9 on 21/02/14.
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
    
    NSString *bundlePath= [[NSBundle mainBundle]pathForResource:@"beers" ofType:@"plist"];
    NSArray *cervezas= [NSArray arrayWithContentsOfFile:bundlePath];
    NSLog(@"%@", cervezas);
}


@end
