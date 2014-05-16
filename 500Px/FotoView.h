//
//  FotoView.h
//  500Px
//
//  Created by iMac 9 on 07/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Foto.h"
@interface FotoView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property (weak, nonatomic) IBOutlet  UIView *fondo;
@property (strong,nonatomic) Foto *foto;
@property (strong,nonatomic) IBOutlet UIActivityIndicatorView *ruleta;
typedef void(^descargarFotoCompletion)(UIImage *image);

-(void) descargaFoto:(Foto *)foto completion:(descargarFotoCompletion)completion;
@end
