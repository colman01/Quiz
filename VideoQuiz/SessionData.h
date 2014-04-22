//
//  SessionData.h
//  ios-prototype-gui-05
//
//  Created by Gerrit Götsch on 11.11.13.
//  Copyright (c) 2013 SUBITO AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SessionData : NSObject

@property (strong, nonatomic) NSString *schema;
@property (strong, nonatomic) NSString *user;
@property (strong, nonatomic) NSString *pass;
@property (nonatomic) BOOL loggedIn;

- (BOOL) loggedIn;

@end
