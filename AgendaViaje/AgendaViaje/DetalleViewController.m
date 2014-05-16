//
//  DetalleViewController.m
//  AgendaViaje
//
//  Created by iMac 9 on 27/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "DetalleViewController.h"
#import "WebViewController.h"


@interface DetalleViewController ()
@property (strong, nonatomic) IBOutlet UILabel *nombre;
@property (strong, nonatomic) IBOutlet UILabel *latitud;
@property (strong, nonatomic) IBOutlet UILabel *longitud;
@property (strong, nonatomic) IBOutlet UIImageView *imagen;

@end

@implementation DetalleViewController

- (IBAction)mostrarWeb:(UIBarButtonItem *)sender {
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
  
    NSLog(@"detalle de lugar %@",self.lugar);
	// Do any additional setup after loading the view.
    self.nombre.text=self.lugar.nombre;
    self.latitud.text=[self.lugar.latitud stringValue];
    self.longitud.text=[self.lugar.longitud stringValue];
    self.imagen.image=[UIImage imageNamed: self.lugar.foto];

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"web"])
    {
        NSLog(@"segue de detalle a DeatlleViewController");
        if([segue.destinationViewController isKindOfClass:[WebViewController class]]){
                WebViewController *webViewController= segue.destinationViewController;
                webViewController.lugar=self.lugar;
            }
    }
}

@end
