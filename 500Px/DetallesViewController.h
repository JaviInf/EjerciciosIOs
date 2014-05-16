//
//  DetallesViewController.h
//  500Px
//
//  Created by iMac 9 on 10/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Foto.h"

@interface DetallesViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *ruletaNueva;
@property (strong,nonatomic) Foto *foto;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeRetroceder;
@property NSUInteger indiceActual;
@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchFoto;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeAvanzar;
@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *rotarFoto;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapFoto;
@end
