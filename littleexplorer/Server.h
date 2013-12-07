//
//  Server.h
//  littleexplorer
//
//  Created by iskander on 07/12/13.
//  Copyright (c) 2013 rhokexplorers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Server : NSObject

- (void) username:(NSString *) user password:(NSString*) pwd handler: (void (^)(BOOL success)) completation;

@end
