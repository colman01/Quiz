//
//  RegisterConnection.h
//  VideoQuiz
//
//  Created by colman on 09.05.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterConnection : NSURLConnection


@property (strong, nonatomic) NSMutableData *_responseData;

typedef void (^SelectCompletionHandler) (NSMutableData *value);
@property (strong, nonatomic) SelectCompletionHandler handler;
- (void) onComplete:(SelectCompletionHandler) handler;

@end
