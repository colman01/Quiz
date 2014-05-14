//
//  ClipDownloader.h
//  VideoQuiz
//
//  Created by colman on 19.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Data.h"
#import "QuizDao.h"
#import "PersistManager.h"


@interface ClipDownloader : NSURLConnection

@property (strong, nonatomic) NSMutableData *_responseData;
@property (strong, nonatomic) NSMutableData *quizData;

@property (strong, nonatomic) UIButton *button;

typedef void (^SelectCompletionHandler) (NSMutableData *value);
@property (strong, nonatomic) SelectCompletionHandler handler;
- (void) onComplete:(SelectCompletionHandler) handler;


@end
