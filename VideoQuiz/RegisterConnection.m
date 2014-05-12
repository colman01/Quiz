//
//  RegisterConnection.m
//  VideoQuiz
//
//  Created by colman on 09.05.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "RegisterConnection.h"

@implementation RegisterConnection

@synthesize _responseData;

#pragma mark NSURLConnection Delegate Methods

//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
//    _responseData = [[NSMutableData alloc] init];
//     NSLog(@"did receice response");
//}
//
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"did receice data");
    [_responseData appendData:data];
}

//- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
//                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
//    // Return nil to indicate not necessary to store a cached response for this connection
//    return nil;
//}

//- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
//    NSLog(@"connection did finish loading");
//    NSLog(@"%@" , [[NSString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding]);
//    self.handler(_responseData);
//}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Fail");
}

#pragma mark

- (void) onComplete:(SelectCompletionHandler) handler {
	self.handler = handler;
}

@end
