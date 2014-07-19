//
//  SKCoreDataStack.h
//  SKCoreDataExample
//
//  Created by Saroj Sharma on 12/07/14.
//  Copyright (c) 2014 Saroj Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface SKCoreDataStack : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;

- (NSFetchedResultsController *)frcWithEntityNamed:(NSString *)entityName
                               withPredicateFormat:(NSString *)predicate
                                   predicateObject:(id)predicateObject
                                   sortDescriptors:(NSString *)sortDescriptors
                             andSectionNameKeyPath:(NSString *)sectionName;

@end