//
//  ViewController.m
//  Happy
//
//  Created by iMac 10 on 27/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"
#import "HappyView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet HappyView *happyView;

@end

@implementation ViewController


- (IBAction)rotation:(UIRotationGestureRecognizer *)recognizer {
    NSLog(@"rotation");
    if ((recognizer.state == UIGestureRecognizerStateChanged) ||
        (recognizer.state == UIGestureRecognizerStateEnded)) {
        self.happyView.rotacion = recognizer.rotation;
    }
}



- (IBAction)pinch:(UIPinchGestureRecognizer *)recognizer {
    NSLog(@"pinch");
    if ((recognizer.state == UIGestureRecognizerStateChanged) ||
        (recognizer.state == UIGestureRecognizerStateEnded)) {
        
        self.happyView.escala = recognizer.scale;
    }
}

- (IBAction)pan:(UIPanGestureRecognizer *)recognizer {
    NSLog(@"pan");
    
    if ((recognizer.state == UIGestureRecognizerStateChanged) ||
        (recognizer.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [recognizer translationInView:self.happyView];

        self.happyView.felicidad = translation.y / (self.happyView.bounds.size.height / 2);
        
        NSLog(@"%f", translation.y);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.happyView.felicidad = 0.5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
