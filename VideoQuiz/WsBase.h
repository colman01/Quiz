//
//  WsBase.h
//  ios-prototype-gui-01
//
//  Created by Gerrit Götsch on 25.10.13.
//  Copyright (c) 2013 SUBITO AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionData.h"

//extern NSString *const BASE_URL;

@interface WsBase : NSObject

+ (NSString *) baseUrl;
- (void) doRequest:(NSString *) urlPath;
- (NSDictionary *) doJsonRequest:(NSString *)url options:(NSJSONReadingOptions)opt withUser:(NSString *) user andPassword:(NSString *) password :(SEL)aSelector;
- (NSMutableURLRequest *) createRequest:(NSString *)url;
- (NSMutableURLRequest *) createRequest:(NSString *)url withUser:(NSString *) user andPassword:(NSString *) password;
- (BOOL) hasForError:(NSError *) error :(SEL)aSelector;

@end
