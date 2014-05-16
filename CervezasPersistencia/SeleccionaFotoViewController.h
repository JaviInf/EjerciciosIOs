//
//  SeleccionaFotoViewController.h
//  Cervezas
//
//  Created by iMac 9 on 25/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cerveza.h"


@protocol SeleccionaFotoViewControllerDelegate <NSObject>
-(void)guardarFotoCerveza:(NSString *)foto;
@end

@interface SeleccionaFotoViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) id <SeleccionaFotoViewControllerDelegate> delegate;
@property (strong, nonatomic) NSArray *arrayPicker;
@end
