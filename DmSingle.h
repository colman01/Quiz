//
//  DmSingle.h
//  VideoQuiz
//
//  Created by colman on 30.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DmQuestion;

@interface DmSingle : NSManagedObject

@property (nonatomic, retain) NSString * answerInput;
@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) DmQuestion *relatedQuestion;

@end
