//
//  ViewController.m
//  UiScrollView
//
//  Created by iMac 9 on 06/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self meterImagenEnScrollView];
    [self activarEscaladoEnScrollView];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark acciones

- (IBAction)min:(UIBarButtonItem *)sender {
    [self.scrollView zoomToRect:self.imageView.bounds animated:YES];
    
}
- (IBAction)cara:(UIBarButtonItem *)sender {
    NSLog(@"%g %g", self.imageView.bounds.size.width, self.imageView.bounds.size.height);
    [self.scrollView zoomToRect:CGRectMake(700, 500, 200, 200) animated:YES];
}
- (IBAction)max:(UIBarButtonItem *)sender {
    [self.scrollView setZoomScale:self.scrollView.maximumZoomScale  animated:YES];
    
}

- (void)activarEscaladoEnScrollView
{
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 4.0;
}


-(void) meterImagenEnScrollView{
    UIImage *imagen=[UIImage imageNamed:@"Mireia.jpg"];
    self.imageView=[[UIImageView alloc]initWithImage:imagen];
    [self.scrollView addSubview:self.imageView];
    [self.scrollView setContentSize:self.imageView.bounds.size];
}

#pragma mark <UIScrollViewDelegate>
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)sender{
    return self.imageView;
}

@end
