//
//  WalkingController.h
//  littleexplorer
//
//  Created by iskander on 07/12/13.
//  Copyright (c) 2013 rhokexplorers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CLLocationManagerDelegate.h>

#import "Server.h"

@interface WalkingController: UITableViewController <UITableViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) IBOutlet id spinner;



@end
