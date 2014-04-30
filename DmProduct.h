//
//  DmProduct.h
//  VideoQuiz
//
//  Created by colman on 30.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DmRating, DmVideo;

@interface DmProduct : NSManagedObject

@property (nonatomic, retain) NSString * answer1;
@property (nonatomic, retain) NSString * answer2;
@property (nonatomic, retain) NSString * answer3;
@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) DmRating *rating;
@property (nonatomic, retain) DmVideo *video;

@end
