//
//  AdventureController.m
//  littleexplorer
//
//  Created by iskander on 07/12/13.
//  Copyright (c) 2013 rhokexplorers. All rights reserved.
//

#import "AdventureController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CLLocation.h>
#import "POI.h"
#import "AppDelegate.h"

@implementation AdventureController
{
    GMSMapView *mapView_;
    NSMutableDictionary* receivedPois;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"AdventureController Did Load");
    
    AppDelegate* app =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    app.locationManager.delegate = self;
    app.locationManager.desiredAccuracy = [[NSNumber numberWithDouble:kCLLocationAccuracyKilometer] doubleValue];
    
    
    if(mapView_ == nil)
    {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        mapView_ = [[GMSMapView alloc] initWithFrame:CGRectMake(0,0,screenWidth,screenHeight/2)];
        mapView_.myLocationEnabled = YES;
        
        [self.view addSubview:mapView_];
    }
    
    // Once configured, the location manager must be "started".
    [app.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillDisappear:(BOOL)animated
{
    AppDelegate* app =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [app.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    // the most recent location update is at the end of the array.
    int l = [locations count];
    NSLog(@"Updating coords (count:%d)", l);
    CLLocation * last = [locations objectAtIndex:(l-1)];
    CLLocationCoordinate2D position = last.coordinate;
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:position.latitude
                                                            longitude:position.longitude
                                                                 zoom:12];

    
    [mapView_ setCamera:camera];
    
    AppDelegate* app =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [app.server updatePoisNearby:position handler:^(NSArray *pois) {
        
        if(!pois)
            return;
        
        NSInteger l = [pois count];
        
        NSLog(@"Drawing pois (count:%d)", l);
        
        for(NSInteger i = 0; i<l; i++){
            id pKey = [NSString stringWithFormat:@"%d",i];
            POI* p = [receivedPois objectForKey:pKey];
            
            if(p == nil){
                p = [pois objectAtIndex:i];
                [receivedPois setObject:p forKey:pKey];
                
                CLLocationCoordinate2D position = [[pois objectAtIndex:i] coordinate];
                GMSMarker *marker2 = [GMSMarker markerWithPosition:position];
                [marker2 setIcon:[UIImage imageNamed:@"nature"]];
                marker2.title = p.name;
                marker2.snippet = p.category;
                marker2.map = mapView_;
            }
        }
    }];
    
    //    NSLog(@"Locations Count: %d - Last: %@",l,last);
}


@end
