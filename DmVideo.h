//
//  DmVideo.h
//  VideoQuiz
//
//  Created by colman on 30.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DmProduct, DmUser;

@interface DmVideo : NSManagedObject

@property (nonatomic, retain) NSData * data;
@property (nonatomic, retain) NSNumber * isViewed;
@property (nonatomic, retain) DmProduct *product;
@property (nonatomic, retain) DmUser *user;

@end
