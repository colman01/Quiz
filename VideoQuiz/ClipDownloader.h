//
//  ClipDownloader.h
//  VideoQuiz
//
//  Created by colman on 19.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClipDownloader : NSURLConnection

@property (strong, nonatomic) NSMutableData *_responseData;

@end
