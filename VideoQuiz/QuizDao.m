//
//  QuizDao.m
//  VideoQuiz
//
//  Created by colman on 22.04.14.
//  Copyright (c) 2014 vquiz. All rights reserved.
//

#import "QuizDao.h"

@implementation QuizDao

static QuizDao *instance = NULL;

+(QuizDao *)instance {
    @synchronized(self) {
        if (instance == NULL)
            instance = [[self alloc] init];
    }
    return instance;
}

#pragma mark data methods

- (void)remove:(DmUser *)user {
	[[[PersistManager instance] managedObjectContext] deleteObject:user];
}

- (NSMutableArray *) getQuiz {
	// initializing NSFetchRequest
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	
	//Setting Entity to be Queried
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
											  inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
	[fetchRequest setEntity:entity];
	NSError* error;
	
	// Query on managedObjectContext With Generated fetchRequest
	NSArray *fetchedRecords = [[[PersistManager instance] managedObjectContext] executeFetchRequest:fetchRequest error:&error];
	
	// Returning Fetched Records
	return [[NSMutableArray alloc] initWithArray:fetchedRecords];
}



- (DmUser *) loadById:(NSNumber *) identifier {
    @try {
    	// initializing NSFetchRequest
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        
        PersistManager *pc = [PersistManager instance];
        
        //Setting Entity to be Queried
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:[pc managedObjectContext]];
        [fetchRequest setEntity:entity];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat: @"identifier = %@", identifier];
        
        [fetchRequest setPredicate:predicate];
        
        NSError* error;
        
        NSLog(@"");
        // Query on managedObjectContext With Generated fetchRequest
        NSManagedObjectContext *context = [pc managedObjectContext];
        NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
        NSLog(@"");
        if (error != nil) {
            NSLog(@"fetchError = %@, details = %@", error, error.userInfo);
            return nil;
        }
        
        if (result.count > 0)
            return  result[0];
        
        DmUser * user    = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
        return user;
        return nil;
}
@catch (NSException *exception) {
      DmUser * user    = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
    return user;
}
 

}


@end