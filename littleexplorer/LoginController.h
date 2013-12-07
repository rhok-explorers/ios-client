//
//  LoginController.h
//  littleexplorer
//
//  Created by iskander on 07/12/13.
//  Copyright (c) 2013 rhokexplorers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController

@property (nonatomic, strong) IBOutlet id login;
@property (nonatomic, strong) IBOutlet id spinner;
@property (nonatomic, strong) IBOutlet id status;

@property (nonatomic, strong) id server;
- (IBAction) doLogin:(id)sender;


@end
