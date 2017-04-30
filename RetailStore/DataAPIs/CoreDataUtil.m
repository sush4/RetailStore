//
//  CoreDataUtil.m
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import "CoreDataUtil.h"
#import <CoreData/CoreData.h>

@interface CoreDataUtil ()

@property (nonatomic, retain) NSPersistentContainer *persistentContainer;

@end

@implementation CoreDataUtil

static CoreDataUtil *coreDataUtil;

+ (CoreDataUtil *)getCoreDataUtilInstance {
    
    if (coreDataUtil == nil) {
        coreDataUtil = [[CoreDataUtil alloc] init];
        [coreDataUtil initializeContext];
    }
    return coreDataUtil;

}

- (void)initializeContext {
    
    if (_persistentContainer == nil) {
        
        NSPersistentContainer *aPersistentContainer = [self getPersistentContainer];
//        _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
//        [_context setPersistentStoreCoordinator:aPersistentContainer];
    }
}

#pragma mark - Core Data stack

- (NSPersistentContainer *)getPersistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"RetailStore"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

//#pragma mark - Core Data Saving support
//
//- (void)saveContext {
//    NSManagedObjectContext *context = self.persistentContainer.viewContext;
//    NSError *error = nil;
//    if ([context hasChanges] && ![context save:&error]) {
//        // Replace this implementation with code to handle the error appropriately.
//        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//        abort();
//    }
//}

@end
