//
//  Server.m
//  littleexplorer
//
//  Created by iskander on 07/12/13.
//  Copyright (c) 2013 rhokexplorers. All rights reserved.
//

#import "Server.h"

@implementation Server

- (void) username:(NSString *) user password:(NSString*) pwd handler: (void (^)(BOOL success)) completation
{
    NSLog(@"Server:Login");
    completation(YES);
}

@end
