//
//  DetalleViewControllerDelegate.h
//  EjemploSplitView
//
//  Created by iMac 9 on 21/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DetalleViewControllerDelegate <NSObject>
-(void)ponerBotonSplitVIew:(UIBarButtonItem *)botonSplitView;
-(void)quitarBotonSplitVIew:(UIBarButtonItem *)botonSplitView;

@end
