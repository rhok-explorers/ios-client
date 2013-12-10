//
//  Server.h
//  littleexplorer
//
//  Created by iskander on 07/12/13.
//  Copyright (c) 2013 rhokexplorers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

@interface Server : NSObject

- (void) username:(NSString *) user password:(NSString*) pwd handler: (void (^)(BOOL success)) completation;
- (void) updatePoisNearby:(CLLocationCoordinate2D) coords handler: (void (^)(NSArray* pois)) completation;
- (void) availableWalkNearby:(CLLocationCoordinate2D) coords handler: (void (^)(NSArray* pois)) completation;

@end
