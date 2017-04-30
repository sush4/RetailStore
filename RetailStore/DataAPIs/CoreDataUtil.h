//
//  CoreDataUtil.h
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Product;
@class ProductManagedObject;

@interface CoreDataUtil : NSObject

+ (CoreDataUtil *)getCoreDataUtilInstance;

- (void)saveContext;

- (NSArray *) getCartList;

- (ProductManagedObject *) addProductToCart:(Product *)product;
- (void) deleteProductFromCart:(ProductManagedObject *) productManagedObject;

@end
