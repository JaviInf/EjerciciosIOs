//
//  WebViewController.m
//  AgendaViaje
//
//  Created by iMac 9 on 27/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation WebViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"Direccion url %@", self.lugar.url);
    NSURL *url=[NSURL URLWithString:self.lugar.url];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];

}


@end
