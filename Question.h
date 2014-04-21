//
//  Question.h
//  VideoQuiz
//
//  Created by colman on 21.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DmUser;

@interface Question : NSManagedObject

@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) NSString * answer1;
@property (nonatomic, retain) NSString * answer4;
@property (nonatomic, retain) NSString * answer3;
@property (nonatomic, retain) NSString * answer2;
@property (nonatomic, retain) NSNumber * isCorrectlyAnsered;
@property (nonatomic, retain) DmUser *user;

@end
