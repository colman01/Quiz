//
//  SessionData.m
//  ios-prototype-gui-05
//
//  Created by Gerrit Götsch on 11.11.13.
//  Copyright (c) 2013 SUBITO AG. All rights reserved.
//

#import "SessionData.h"
#import <Objection-iOS/Objection.h>

@implementation SessionData

@synthesize schema,user,pass,loggedIn;

objection_register_singleton(SessionData)

- (void) awakeFromNib {
	schema = @"Default";
}


@end
