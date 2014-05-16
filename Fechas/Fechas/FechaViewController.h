//
//  FechaViewController.h
//  Fechas
//
//  Created by iMac 9 on 24/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FechaViewControllerDelegate <NSObject>
-(void)aceptarFecha:(NSDate *)fecha;
-(void)cancelarFecha;
@end

@interface FechaViewController : UIViewController
@property (weak,nonatomic) id<FechaViewControllerDelegate> delegate;
@property (strong,nonatomic) NSDate * fecha;
@end
