//
//  MapaViewController.m
//  AgendaViaje
//
//  Created by iMac 9 on 26/03/14.
//  Copyright (c) 2014 javi. All rights reserved.
//

#import "MapaViewController.h"
#import "LugarMKAnnotation.h"
#import "Modelo.h"
#import "DetalleViewController.h"
#import "Lugar.h"

@interface MapaViewController ()<MKMapViewDelegate>
@property (strong, nonatomic) Modelo *modelo;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) LugarMKAnnotation* lugar;
@property (strong,nonatomic) NSArray* lugares;
@property (strong,nonatomic) NSString * ciudad;
@end

@implementation MapaViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.modelo=[Modelo sharedInstance];
    self.mapView.delegate=self;
    CLLocationCoordinate2D centro=CLLocationCoordinate2DMake(43.312527, 1.898613);
//    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(10.312527, -1.898613) animated:YES];
    MKCoordinateSpan span=MKCoordinateSpanMake(30.0, 30.0);
    MKCoordinateRegion region=MKCoordinateRegionMake(centro,span);
    [self.mapView setRegion:region animated:YES];
    NSLog(@"MapaViewController");
    [self buscarLugares];
    
}

-(NSArray *)buscarLugares{
    NSLog(@"----");
    NSFetchRequest *request =[[NSFetchRequest alloc]initWithEntityName:@"Lugar"];
    NSError *error=nil;
   self.lugares=[self.modelo.documento.managedObjectContext executeFetchRequest:request error:&error];
    if(self.lugares){
        for (Lugar * lugar in self.lugares) {
            CLLocationCoordinate2D ciudad=CLLocationCoordinate2DMake( [lugar.latitud doubleValue], [lugar.longitud doubleValue]);
            self.lugar=[[LugarMKAnnotation alloc]initConCoordenadas:ciudad titulo:lugar.nombre subtitulo:lugar.nombre];
            [self.mapView addAnnotation:self.lugar];
        }
        
        
    }
    return self.lugares;
}


#pragma mark <MKMapViewDelegate>

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    NSLog(@"touch del pin %@", view.annotation);
    NSLog(@"%@",view);
    
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
    NSLog(@"tapped del pin %@", [view.annotation subtitle]);
    self.ciudad=[view.annotation subtitle];
    
    [self performSegueWithIdentifier:@"transicionLugar" sender:view];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"transicionLugar"])
    {
        NSLog(@"segue de Mapa a DeatlleViewController");
        if([segue.destinationViewController isKindOfClass:[DetalleViewController class]]){
            DetalleViewController *detalleViewController= segue.destinationViewController;
            NSLog(@"mnmnm %@",self.lugar.title);
            NSLog(@"Sender : %@",sender);
            for( Lugar* lugar in self.lugares){
                if(lugar.nombre==self.ciudad){
                    detalleViewController.lugar=lugar;
                }
            }
            
        }
    }

    }
@end
