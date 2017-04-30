//
//  Product.m
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import "Product.h"

static NSString *keyName     = @"name";
static NSString *keyCategory = @"category";
static NSString *ketPrice    = @"price";
static NSString *keyimage    = @"image";

@implementation Product

- (instancetype) initWithDistionary:(NSDictionary *) data {
    
    self = [super init];
    if (self) {
        _name     = [data objectForKey:keyName];
        _category = [data objectForKey:keyCategory];
        _price    = [data objectForKey:ketPrice];
        _image    = [data objectForKey:keyimage];
    }
    return self;
    
}

@end
