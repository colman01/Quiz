//
//  DmUser.h
//  VideoQuiz
//
//  Created by colman on 21.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DmVideo, Question;

@interface DmUser : NSManagedObject

@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSSet *video;
@property (nonatomic, retain) NSSet *question;
@end

@interface DmUser (CoreDataGeneratedAccessors)

- (void)addVideoObject:(DmVideo *)value;
- (void)removeVideoObject:(DmVideo *)value;
- (void)addVideo:(NSSet *)values;
- (void)removeVideo:(NSSet *)values;

- (void)addQuestionObject:(Question *)value;
- (void)removeQuestionObject:(Question *)value;
- (void)addQuestion:(NSSet *)values;
- (void)removeQuestion:(NSSet *)values;

@end
