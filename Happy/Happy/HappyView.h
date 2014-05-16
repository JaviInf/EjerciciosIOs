//
//  HappyView.h
//  Happy
//
//  Created by iMac 14 on 27/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>

// estructura para dibujar el smiley
struct XYRadio{
    CGFloat x;
    CGFloat y;
    CGFloat radio;
};

typedef struct XYRadio XYRadio;


@interface HappyView : UIView

@property (nonatomic) CGFloat felicidad;
@property (nonatomic) CGFloat escala;
@property (nonatomic) CGFloat rotacion;


@end
