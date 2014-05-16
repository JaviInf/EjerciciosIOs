//
//  AñadirViewController.h
//  Cervezas
//
//  Created by iMac 9 on 25/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cerveza.h"
#import "SeleccionaFotoViewController.h"

@protocol EditarViewControllerDelegate <NSObject>
-(void)guardarCerveza:(Cerveza *)cerveza;
@end


@interface An_adirViewController : UIViewController <SeleccionaFotoViewControllerDelegate>
@property (strong, nonatomic) Cerveza * cerveza;
@property (weak, nonatomic) id <EditarViewControllerDelegate> delegate;
@end

