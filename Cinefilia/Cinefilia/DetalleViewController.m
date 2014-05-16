//
//  DetalleViewController.m
//  Cinefilia
//
//  Created by iMac 9 on 01/04/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "DetalleViewController.h"
#import "WebViewViewController.h"

@interface DetalleViewController ()
@property (strong, nonatomic) IBOutlet UITextField *argumento;
@property (strong, nonatomic) IBOutlet UITextView *genero;


@property (strong, nonatomic) IBOutlet UIImageView *poster;
@property (strong, nonatomic) IBOutlet UITextView *actores;
@property (strong, nonatomic) IBOutlet UITextView *directores;


@end

@implementation DetalleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.leftItemsSupplementBackButton=YES;
    self.argumento.text=self.pelicula.argumento;
    self.genero.text=self.pelicula.genero;
    self.actores.text=self.pelicula.actores;
    self.directores.text=self.pelicula.actores;
    self.poster.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.pelicula.poster]]];
    
}
// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"web"])
    {
        NSLog(@"segue de web a WebViewController");
        if([segue.destinationViewController isKindOfClass:[WebViewViewController class]]){
                           WebViewViewController *webViewController= segue.destinationViewController;
            NSString *url=self.pelicula.imdb_url;
              webViewController.url=url;
        }
    }
}

- (IBAction)pulsarCompartir:(id)sender {
    NSString *texto = self.pelicula.titulo;
    UIImage *foto = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.pelicula.poster]]];

    NSArray *activityItems = @[texto, foto];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    [self presentViewController:activityVC animated:YES completion:^{}];
}



@end
