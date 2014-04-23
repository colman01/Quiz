//
//  Connection.m
//  Daft
//
//  Created by Colman Marcus-Quinn on 06.04.14.
//  Copyright (c) 2014 SUBITO. All rights reserved.
//

#import "Connection.h"

@implementation Connection
@synthesize progressView;
@synthesize imageView;
@synthesize propertySwitch;

float progressFraction;
NSMutableData *data;

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [response expectedContentLength];
    self.expectedMax = [NSNumber numberWithDouble:[response expectedContentLength]];
}

- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
	if (data==nil) { data = [[NSMutableData alloc] initWithCapacity:2048]; }
    progressFraction += incrementalData.length;
    float currentFraction = progressFraction/[self.expectedMax floatValue];
    [progressView setProgress:currentFraction animated:YES];
    [data appendData:incrementalData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    progressFraction = 0;
}

- (void) downloadImage:(NSString *) urlString {
    if (urlString.length < 1)
        urlString = @"http://upload.wikimedia.org/wikipedia/commons/4/4e/Pleiades_large.jpg";
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]
                                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                                            timeoutInterval:60.0];
    NSURLConnection *connection =  [[NSURLConnection alloc] initWithRequest:theRequest delegate:self ];
    [connection start];
    [progressView setProgress:0.0 animated:YES];
}

@end

