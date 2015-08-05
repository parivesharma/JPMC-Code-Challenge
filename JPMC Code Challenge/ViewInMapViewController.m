//
//  ViewInMapViewController.m
//  JPMC Code Challenge
//
//  Created by Vastika Inc on 8/5/15.
//  Copyright (c) 2015 parivesh. All rights reserved.
//

#import "ViewInMapViewController.h"

#import "DetailViewController.h"

#import "ATMData.h"

@interface ViewInMapViewController ()

@property (nonatomic)ATMData *markerData;



@end

@implementation ViewInMapViewController

//Focusing map and adding the annotation pins on the Google map
- (void)viewDidLoad {
    [super viewDidLoad];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[self.latitude doubleValue] longitude:[self.longitude doubleValue] zoom:14];
    GMSMapView *mapView = [GMSMapView mapWithFrame:self.smallView.bounds camera:camera];
    
    
    mapView.delegate = self;
    
    //NSLog(@"%ld", [self.atmList count]);
    
    for (ATMData *data in self.atmList) {
        
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake([data.latitude doubleValue], [data.longitude doubleValue]);
        marker.appearAnimation = kGMSMarkerAnimationPop;
        marker.title = @"Location selected";
        marker.snippet = @"Testing";
        
        marker.icon = [UIImage imageNamed:@"flag_icon"];
        marker.map = mapView;
        
        marker.userData = data;
        
    }
        [self.smallView addSubview: mapView];
    
}


//Implementing the d
-(BOOL) mapView:(GMSMapView *) mapView didTapMarker:(GMSMarker *)marker
{
    
    
    self.markerData = (ATMData*)marker.userData;
    
    [self performSegueWithIdentifier:@"detail" sender:self];
    
    //[mapView setSelectedMarker:marker];
    NSLog(@"try");
    return YES;
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    
    if ([segue.identifier isEqualToString:@"detail"]) {
        
        DetailViewController *detailView = segue.destinationViewController;
        
        detailView.atmData = (ATMData*)self.markerData;
        
    }
    
}

@end
