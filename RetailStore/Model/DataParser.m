//
//  DataParser.m
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import "DataParser.h"
#import "Product.h"

static NSString *keyProducts = @"Products";

@implementation DataParser

+ (NSArray *) getProductListData:(NSDictionary *) data {
    
    NSMutableArray *productList = [NSMutableArray array];
    for (NSDictionary *productData in [data objectForKey:keyProducts]) {
        Product *product = [[Product alloc] initWithDistionary:productData];
        [productList addObject:product];
    }
    return [productList copy];
    
}

@end
