//
//  DmRating.h
//  VideoQuiz
//
//  Created by colman on 30.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DmProduct;

@interface DmRating : NSManagedObject

@property (nonatomic, retain) NSNumber * value;
@property (nonatomic, retain) DmProduct *product;

@end
