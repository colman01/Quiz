//
//  ClipDownloader.m
//  VideoQuiz
//
//  Created by colman on 19.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "ClipDownloader.h"

@implementation ClipDownloader
@synthesize _responseData;
@synthesize button;

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    NSLog(@"did response");
    UIImage *img = [UIImage imageNamed:@"clipready.png"];
    button.imageView.image = img;
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    NSLog(@"did finsih");
//    [button setBackgroundImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    NSLog(@"finished loading");
    UIImage *img = [UIImage imageNamed:@"heart.png"];
    button.imageView.image = img;
    
    NSLog(@"%@" , [[NSString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding]);
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Fail");
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 1.0;
    
    // The request has failed for some reason!
    // Check the error var
}

@end
