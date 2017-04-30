//
//  ProductManagedObject.h
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import <CoreData/CoreData.h>
@class Product;

@interface ProductManagedObject : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *category;
@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSString *price;

@end
