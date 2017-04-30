//
//  CoreDataUtil.m
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import "CoreDataUtil.h"
#import <CoreData/CoreData.h>
#import "ProductManagedObject.h"
#import "Product.h"

static NSString *ProductEntity = @"CartProduct";

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
        [self initPersistentContainer];
    }
}

- (NSArray *) getCartList {
    
    NSManagedObjectContext *managedContext = _persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:ProductEntity];
    
    NSError *error = nil;
    NSArray *results = [managedContext executeFetchRequest:fetchRequest error:&error];
    if (!results) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    return results;
}

- (ProductManagedObject *) addProductToCart:(Product *)product {
    
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    ProductManagedObject *productManagedObject = [NSEntityDescription insertNewObjectForEntityForName:ProductEntity inManagedObjectContext:context];
    productManagedObject.name = product.name;
    productManagedObject.category = product.category;
    productManagedObject.price = [product.price stringValue];
    productManagedObject.image = product.image;
    return productManagedObject;
}

- (void) deleteProductFromCart:(ProductManagedObject *) productManagedObject {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    [context deleteObject:productManagedObject];
}

#pragma mark - Core Data stack

- (void) initPersistentContainer {
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
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
