//
//  DmUser.m
//  VideoQuiz
//
//  Created by colman on 30.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "DmUser.h"
#import "DmQuestion.h"
#import "DmVideo.h"


@implementation DmUser

@dynamic password;
@dynamic username;
@dynamic points;
@dynamic question;
@dynamic video;
@synthesize questionObject;
@synthesize feedbackQuestion;
@synthesize productQuestion;


- (void)addVideoObject:(DmVideo *)value {
    NSSet *tempSet = [NSSet setWithObjects:self.video, nil];
    
    NSArray *vids = [self.video allObjects];
    NSMutableArray *vids_ = [[NSMutableArray alloc] initWithArray:vids];
    [vids_ addObject:value];
    self.video = [[NSSet alloc] initWithArray:[[NSArray alloc] initWithArray:vids_]];
    
//    
//    NSMutableOrderedSet* tempSet_ = [NSMutableOrderedSet orderedSetWithOrderedSet:self.video];
//    [tempSet_ addObject:value];
//    self.video = [NSSet set
    
    
//	NSMutableOrderedSet* tempSet = [NSMutableOrderedSet orderedSetWithOrderedSet:self.images];
//	[tempSet addObject:value];
//	self.images = tempSet;
}


- (void)addQuestionObject:(DmQuestion *)value{
    NSSet *tempSet = [NSSet setWithObjects:self.question, nil];
    
    NSArray *question = [self.question allObjects];
    NSMutableArray *question_ = [[NSMutableArray alloc] initWithArray:question];
    [question_ addObject:value];
    self.question = [[NSSet alloc] initWithArray:[[NSArray alloc] initWithArray:question_]];
    if (!self.questionObject) {
        questionObject = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
    }
    self.questionObject = value;

}
@end
