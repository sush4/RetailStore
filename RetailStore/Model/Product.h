//
//  Product.h
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

- (instancetype) initWithDistionary:(NSDictionary *) data;

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *category;
@property (nonatomic, strong, readonly) NSString *image;
@property (nonatomic, strong, readonly) NSNumber *price;

@end
