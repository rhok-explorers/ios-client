//
//  Server.m
//  littleexplorer
//
//  Created by iskander on 07/12/13.
//  Copyright (c) 2013 rhokexplorers. All rights reserved.
//

#import "Server.h"
#import "POI.h"
#import <CoreLocation/CLLocation.h>

@implementation Server

- (void) username:(NSString *) user password:(NSString*) pwd handler: (void (^)(BOOL success)) completation
{
    NSLog(@"Server:Login");
    completation(YES);
}

- (void) updatePoisNearby:(CLLocationCoordinate2D) coords handler: (void (^)(NSArray* pois)) completation
{
    
    int static kPois = 7;
    NSMutableArray* pois = [[NSMutableArray alloc] initWithCapacity:kPois];
    
    for(int i=0; i<kPois; i++){
        POI* poi = [POI new];
        poi.id = [NSString stringWithFormat:@"%d",i];
        poi.name = @"POI";
        poi.category = @"NATURE";
        poi.coordinate = CLLocationCoordinate2DMake(coords.latitude+i/10, coords.longitude + i/10);
        [pois addObject:poi];
    }
    
    completation(pois);
}

- (void) availableWalkNearby:(CLLocationCoordinate2D) coords handler: (void (^)(NSArray* pois)) completation
{
    int static kPois = 7;
    NSMutableArray* pois = [[NSMutableArray alloc] initWithCapacity:kPois];
    
    for(int i=0; i<kPois; i++){
        POI* poi = [POI new];
        poi.id = [NSString stringWithFormat:@"%d",i];
        poi.name = @"Station";
        poi.category = @"STATION";
        poi.coordinate = CLLocationCoordinate2DMake(coords.latitude+i/10, coords.longitude + i/10);
        [pois addObject:poi];
    }
    
    completation(pois);
}

@end
