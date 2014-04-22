//
//  QuizDao.h
//  VideoQuiz
//
//  Created by colman on 22.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Data.h"
#import "PersistManager.h"

@interface QuizDao : NSObject




+ (QuizDao *) instance;
- (NSMutableArray*) getQuiz;
- (DmUser *) loadById:(NSNumber *) id;

@end
