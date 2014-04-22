//
//  PersistManager.h
//  ios-prototype-gui-01
//
//  Created by Gerrit Götsch on 22.10.13.
//  Copyright (c) 2013 SUBITO AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface PersistManager : NSObject

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (PersistManager *)instance;

- (void) save;

@end
