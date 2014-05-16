//
//  ViewController.h
//  EjemploZBarSDK
//
//  Created by iMac 9 on 19/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZBarSDK.h>

@interface ViewController : UIViewController <ZBarReaderDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *resultImage;
@property (weak, nonatomic) IBOutlet UITextView *resultText;


@end
