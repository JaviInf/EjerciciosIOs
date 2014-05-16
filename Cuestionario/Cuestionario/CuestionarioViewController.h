//
//  CuestionarioViewController.h
//  Cuestionario
//
//  Created by iMac 9 on 13/02/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CuestionarioViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *pregunta;
@property (strong, nonatomic) IBOutlet UIButton *verPregunta;
@property (strong, nonatomic) IBOutlet UILabel *respuesta;
@property (strong, nonatomic) IBOutlet UIButton *siguientePregunta;
@end
