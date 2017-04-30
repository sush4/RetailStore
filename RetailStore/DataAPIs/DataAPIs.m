//
//  DataAPIs.m
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import "DataAPIs.h"
#import "DataParser.h"
#import "ProductViewModel.h"

@implementation DataAPIs

+ (NSArray *) getData{
    
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MockData" ofType:@"plist"]];
    NSArray *productList = [DataParser getProductListData:data];
    return productList;
    
}

@end
