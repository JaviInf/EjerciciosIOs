//
//  WebViewViewController.m
//  Cinefilia
//
//  Created by iMac 9 on 01/04/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString: self.url]];
    [self.webView loadRequest:request];

}

@end
