//
//  ViewController.m
//  CamaraFotos
//
//  Created by iMac 9 on 19/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *camara;
@property (strong, nonatomic) IBOutlet UIImageView *fotoImageView;
@property (strong,nonatomic) IBOutlet UIImagePickerController* imagePickerController;
@property (strong,nonatomic) NSURL * cacheURL;

@end

@implementation ViewController

#pragma mark inicializacion

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self logCameraDevices];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pulsarCamara:(UIBarButtonItem *)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self showImagePicker:UIImagePickerControllerSourceTypeCamera];
    } else {
        [self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
    }
}

- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType
{
    if([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        self.imagePickerController = [[UIImagePickerController alloc] init];
        self.imagePickerController.sourceType = sourceType;
        self.imagePickerController.delegate = self;
        [self guardarEnCache:self.fotoImageView.image];

        [self presentViewController:self.imagePickerController animated:YES completion:^{}];
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    self.fotoImageView.image = image;
        [self dismissViewControllerAnimated:YES completion:^{}];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}
#pragma mark inicializacion
- (void)logCameraDevices
{
    NSLog(@"AVCaptureDevice devices: %@", [AVCaptureDevice devices]);
}


-(NSURL*)cacheURL {
    if(!_cacheURL){
        _cacheURL=[[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask]lastObject];
        NSLog(@"cache_URL path : %@", [_cacheURL path]);
        NSLog(@"cache_URL : %@", _cacheURL);

    }
    return _cacheURL;
}

-(void) guardarEnCache:(UIImage *)image{
    NSData * data=UIImageJPEGRepresentation(image, 0.8);
    NSURL *archivo=[self.cacheURL URLByAppendingPathComponent:@"foto.jpg"];
    [data writeToURL:archivo atomically:YES];
    NSLog(@"%@",archivo);
}
@end
