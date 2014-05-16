//
//  ViewController.m
//  EjemploSocialFrameWork
//
//  Created by iMac 9 on 31/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>


@interface ViewController ()
@property (strong, nonatomic) ACAccountStore *accountStore;
@property (strong, nonatomic) ACAccount *twitterAccount;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetsLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupTwitter];
}
- (IBAction)compartir:(UIBarButtonItem *)sender {
    //items para compartir
    NSString *texto = @"¡Hola Mundo!";
    UIImage *foto = [UIImage imageNamed:@"beer_anchor_christmas.jpg"];
    
    // Array de items
    NSArray *activityItems = @[texto, foto];
    
    //crear ViewController de actividades
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                             applicationActivities:nil];
    
    //Presentar ViewControlles de actvidades
    [self presentViewController:activityVC
                       animated:YES
                     completion:^{}];
}
- (IBAction)facebbok:(UIBarButtonItem *)sender {
    SLComposeViewController *facebookPostVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [facebookPostVC setInitialText:@"¡Hola Mundo!"];
    [facebookPostVC addImage:[UIImage imageNamed:@"beer_anchor_christmas.jpg"]];
    [self presentViewController:facebookPostVC animated:YES completion:^{}];

}
- (IBAction)twitter:(UIBarButtonItem *)sender {
    SLComposeViewController *twitterPostVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitterPostVC setInitialText:@"¡Hola Mundo!"];
    [twitterPostVC addImage:[UIImage imageNamed:@"beer_anchor_christmas.jpg"]];
    [self presentViewController:twitterPostVC animated:YES completion:^{}];

}

- (void)setupTwitter
{
    self.accountStore = [[ACAccountStore alloc] init];
    ACAccountType *twitterAccountType = [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [self.accountStore requestAccessToAccountsWithType:twitterAccountType options:nil completion:^(BOOL granted, NSError *error) {
        if(granted) {
            NSArray *accounts = [self.accountStore accountsWithAccountType:twitterAccountType];
            self.twitterAccount = [accounts lastObject];
            NSLog(@"Ok: tenemos permiso para acceder");
            [self twitterRequest];
        } else {
            NSLog(@"Error: no tenemos permiso para acceder");
        }
    }];
}

- (void)twitterRequest
{
    // Crear consulta
    SLRequest *twitterInfoRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:@"https://api.twitter.com/1.1/users/show.json"] parameters:[NSDictionary dictionaryWithObject:@"As_TomasRoncero" forKey:@"screen_name"]];
    // Asociar request con cuenta de usuario
    [twitterInfoRequest setAccount:self.twitterAccount];
    // Enviar consulta
    [twitterInfoRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            // Chequear si hemos llegado al límite de consultas
            if([urlResponse statusCode] == 429) {
                NSLog(@"Rate limit reached");
                return;
            }
            // Chequear si ha habido un error
            if(error) {
                NSLog(@"Error: %@", error.localizedDescription);
                return;
            }
            // Chequear si hay datos en la respuesta
            if(responseData) {
                NSError *error = nil;
                NSArray *TWData = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&error];
                NSString *screen_name = [(NSDictionary *)TWData objectForKey:@"screen_name"];
                NSString *name = [(NSDictionary *)TWData objectForKey:@"name"];
                int followers = [[(NSDictionary *)TWData objectForKey:@"followers_count"] integerValue];
                int following = [[(NSDictionary *)TWData objectForKey:@"friends_count"] integerValue];
                int tweets = [[(NSDictionary *)TWData objectForKey:@"statuses_count"] integerValue];
                self.nameLabel.text = name;
                self.usernameLabel.text= [NSString stringWithFormat:@"@%@",screen_name];
                self.tweetsLabel.text = [NSString stringWithFormat:@"%i", tweets];
                self.followingLabel.text= [NSString stringWithFormat:@"%i", following];
                self.followersLabel.text = [NSString stringWithFormat:@"%i", followers];
                NSString *lastTweet = [[(NSDictionary *)TWData objectForKey:@"status"] objectForKey:@"text"];
                self.statusLabel.text= lastTweet;
                // Obtener foto de perfil (solo la primera vez)
                if(!self.profileImageView.image) {
                    NSString *profileImageStringURL = [(NSDictionary *)TWData objectForKey:@"profile_image_url_https"];
                    profileImageStringURL = [profileImageStringURL stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
                    self.profileImageView.image = [self getProfileImageForURLString:profileImageStringURL];
                }
            }
        });
    }];
}
- (UIImage *) getProfileImageForURLString:(NSString *)urlString;
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return [UIImage imageWithData:data];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
