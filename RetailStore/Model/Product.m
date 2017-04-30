//
//  Product.m
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import "Product.h"
#import "ProductManagedObject.h"

static NSString *keyName     = @"name";
static NSString *keyCategory = @"category";
static NSString *keyPrice    = @"price";
static NSString *keyimage    = @"image";

@implementation Product

- (instancetype) initWithDistionary:(NSDictionary *) data {
    
    self = [super init];
    if (self) {
        _name     = [data objectForKey:keyName];
        _category = [data objectForKey:keyCategory];
        _price    = [data objectForKey:keyPrice];
        _image    = [data objectForKey:keyimage];
    }
    return self;
    
}

- (instancetype) initWithProductManagedObject:(ProductManagedObject *)productManagedObject {
    
    self = [super init];
    if (self) {
        _name     = productManagedObject.name;
        _category = productManagedObject.category;
        _price    = [NSNumber numberWithDouble:[productManagedObject.price doubleValue]];
        _image    = productManagedObject.image;
    }
    return self;
    
}

@end
