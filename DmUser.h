//
//  DmUser.h
//  VideoQuiz
//
//  Created by colman on 30.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DmQuestion, DmVideo;

@interface DmUser : NSManagedObject

@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSSet *question;
@property (nonatomic, retain) NSSet *video;
@end

@interface DmUser (CoreDataGeneratedAccessors)

- (void)addQuestionObject:(DmQuestion *)value;
- (void)removeQuestionObject:(DmQuestion *)value;
- (void)addQuestion:(NSSet *)values;
- (void)removeQuestion:(NSSet *)values;

- (void)addVideoObject:(DmVideo *)value;
- (void)removeVideoObject:(DmVideo *)value;
- (void)addVideo:(NSSet *)values;
- (void)removeVideo:(NSSet *)values;

@end
