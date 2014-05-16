//
//  ViewController.m
//  EjemploActionSheet
//
//  Created by iMac 9 on 31/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIActionSheetDelegate>
@property (strong,nonatomic) UIActionSheet * acciones;
@property (strong,nonatomic) UIActionSheet * compartir;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)acciones:(UIBarButtonItem *)boton1 {
    if (!self.acciones) {
        self.acciones= [[UIActionSheet alloc]initWithTitle:@"accioners"
                                                  delegate:self
                                         cancelButtonTitle:@"Cancelar"
                                    destructiveButtonTitle:@"Borrar"
                                         otherButtonTitles:@"Añadir", nil];
    }
    if(![self.acciones isVisible]){
        [self.acciones showFromBarButtonItem:boton1 animated:YES];
    }
    
}

-(IBAction)compartir:(UIBarButtonItem*)boton{
  if (!self.compartir) {
    self.compartir= [[UIActionSheet alloc]initWithTitle:@"Compartir"
                                              delegate:self
                                     cancelButtonTitle:@"Cancelar"
                                destructiveButtonTitle:nil
                                     otherButtonTitles:@"Facebook", @"Twetter", @"G+", nil];
  }
    if(![self.compartir isVisible]){
        [self.compartir showFromBarButtonItem:boton animated:YES];
    }
}

#pragma mark UIActionSheetDelegate

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"%@", [actionSheet buttonTitleAtIndex:buttonIndex]);
    if (buttonIndex== actionSheet.destructiveButtonIndex) {
        NSLog(@"Boton destructivo %ld", (long)buttonIndex);
    }else if (buttonIndex== actionSheet.cancelButtonIndex){
        NSLog(@"Boton cancelar %ld", (long)buttonIndex);}
    else NSLog(@"Otro boton");
    
}

@end
