//
//  LoginController.m
//  littleexplorer
//
//  Created by iskander on 07/12/13.
//  Copyright (c) 2013 rhokexplorers. All rights reserved.
//

#import "LoginController.h"
#import "DashboardController.h"
#import "Server.h"

@interface LoginController ()

@end

@implementation LoginController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"Login Did Load");
    self.server = [Server new];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) doLogin:(id)sender
{
    [self.spinner startAnimating];
    
    [[self server] username:@"" password:@"" handler:^(BOOL success){
        
        NSLog(@"Server:Login:%hhd", success);
        [self.spinner stopAnimating];
        
        if(success){
            
            [[self status] setText:@"Yeah! Pronti attenti e via"];
            
           // NSLog(@"nav controller: %@", self.navigationController);
            
//            [[self navigationController] pushViewController:[DashboardController new] animated:NO];
            
            [self performSegueWithIdentifier: @"doLogin" sender:self];
            
        }else{
            [[self status] setText: @"Ups i dati non sono corretti"];
        }
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        
    if ([segue.identifier isEqualToString:@"doLogin"]) {
        DashboardController *profileViewController = segue.destinationViewController;
//        profileViewController.isFromDealView = YES;
        profileViewController.hidesBottomBarWhenPushed = YES;
    }
}

@end
