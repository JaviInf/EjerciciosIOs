//
//  FotoView.m
//  500Px
//
//  Created by iMac 9 on 07/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "FotoView.h"

@implementation FotoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void) descargaFoto:(Foto *)foto completion:(descargarFotoCompletion)completion{
    self.foto=foto;
    self.imageView.image=nil;
    [self.ruleta startAnimating];
    [self.foto descargaFotoConCalidad:@"3.jpg" completion: ^(UIImage *image){
        [self.ruleta stopAnimating];
        if(self.foto.urlFoto==foto.urlFoto){
            completion(image);
        }
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
