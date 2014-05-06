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

@property (strong, nonatomic) DmUser *currentUser;


+ (QuizDao *) instance;
- (NSMutableArray*) getQuiz;
- (DmUser *) loadById:(NSNumber *) id;
- (void)remove:(DmUser *)user;

@end
