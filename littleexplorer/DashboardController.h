//
//  DashboardController.h
//  littleexplorer
//
//  Created by iskander on 07/12/13.
//  Copyright (c) 2013 rhokexplorers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardController : UIViewController

@property (nonatomic, strong) IBOutlet id newadventure;
@property (nonatomic, strong) IBOutlet id restoreadventure;

- (IBAction) doAdventure: (id)sender;

@end
