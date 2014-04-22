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

- (void)remove:(DmUser *)inspection {
	[[[PersistManager instance] managedObjectContext] deleteObject:inspection];
}

- (NSMutableArray *) getAllQuiz {
	// initializing NSFetchRequest
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	
	//Setting Entity to be Queried
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Inspection"
											  inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
	[fetchRequest setEntity:entity];
	NSError* error;
	
	// Query on managedObjectContext With Generated fetchRequest
	NSArray *fetchedRecords = [[[PersistManager instance] managedObjectContext] executeFetchRequest:fetchRequest error:&error];
	
	// Returning Fetched Records
	return [[NSMutableArray alloc] initWithArray:fetchedRecords];
}

#pragma mark Pull data from google storted locally
-(NSArray *) getGoogleData {
    // initializing NSFetchRequest
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"GoogleData"
											  inManagedObjectContext:[[PersistManager instance] managedObjectContext]];
    
    [fetchRequest setEntity:entity];
    NSError* error;
	
    // Query on managedObjectContext With Generated fetchRequest
    NSArray *fetchedRecords = [[[PersistManager instance] managedObjectContext] executeFetchRequest:fetchRequest error:&error];
	
    // Returning Fetched Records
    return fetchedRecords;
}

- (DmUser *) loadById:(NSNumber *) identifier {
	// initializing NSFetchRequest
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	
	PersistManager *pc = [PersistManager instance];
	
	//Setting Entity to be Queried
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Inspection" inManagedObjectContext:[pc managedObjectContext]];
	[fetchRequest setEntity:entity];
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat: @"identifier = %@", identifier];
	
	[fetchRequest setPredicate:predicate];
	
	NSError* error;
	
	// Query on managedObjectContext With Generated fetchRequest
	NSArray *result = [[pc managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
	if (error != nil) {
		NSLog(@"fetchError = %@, details = %@", error, error.userInfo);
		return nil;
	}
	
	if (result.count > 0)
		return  result[0];
	return nil;
}


@end