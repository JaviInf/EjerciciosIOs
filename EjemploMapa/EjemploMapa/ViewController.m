//
//  ViewController.m
//  EjemploMapa
//
//  Created by iMac 9 on 26/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "ViewController.h"
#import "LugarMKAnnotation.h"
@interface ViewController () <MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) LugarMKAnnotation* lugar;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.delegate=self;
    CLLocationCoordinate2D centro=CLLocationCoordinate2DMake(43.312527, -1.898613);
	// Do any additional setup after loading the view, typically from a nib.
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(43.312527, -1.898613) animated:YES];
    MKCoordinateSpan span=MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion region=MKCoordinateRegionMake(centro,span);
    [self.mapView setRegion:region animated:YES];
    
    //crear pin
    
    self.lugar=[[LugarMKAnnotation alloc]initConCoordenadas:centro titulo:@"Errenteria" subtitulo:@"Euskadi"];
    [self.mapView addAnnotation:self.lugar];
}
#pragma mark <MKMapViewDelegate>

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    NSLog(@"touch del pin %@", view.annotation);
    
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKAnnotationView *aView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"Lugar"];
   if(!aView) {
        aView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                reuseIdentifier:@"Lugar"];
        // set canShowCallout to YES and build aView’s callout accessory views here
       aView.canShowCallout=YES;
       
   }
        aView.annotation = annotation; // yes, this happens twice if no dequeue
        // maybe load up accessory views here (if not too expensive)?
        // or reset them and wait until mapView:didSelectAnnotationView: to load actual data
    aView.rightCalloutAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        return aView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    NSLog(@"tapped del pin %@", view.annotation);
    [self performSegueWithIdentifier:@"transicionLugar" sender:view];
}

@end
