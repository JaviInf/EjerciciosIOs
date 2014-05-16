//
//  AñadirLibroViewController.h
//  Libros
//
//  Created by iMac 9 on 19/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Libro.h"
#import <ZBarSDK.h>
#import "Autor.h"

@interface An_adirLibroViewController : UIViewController <ZBarReaderDelegate>
@property (strong, nonatomic) Libro * libro;
-(IBAction) textFieldDoneEditing : (id) sender;
@end
