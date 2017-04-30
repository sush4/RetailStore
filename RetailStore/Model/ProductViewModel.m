//
//  ProductViewModel.m
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import "ProductViewModel.h"
#import "Product.h"

@interface ProductViewModel ()

@property (nonatomic, strong) NSArray *groupPoductList;
@property (nonatomic, strong) NSArray *sectionTitle;

@end

@implementation ProductViewModel

- (instancetype) initWithList:(NSArray *)productList {
    self = [super init];
    if (self) {
        [self initObject:productList];
    }
    return self;
}

// initObject: is used to group productList based on category and initialize poductList and sectionTitle based on different category.

- (void) initObject:(NSArray *) productList {
    
//    Grouping logic based on category
    _sectionTitle = [productList valueForKeyPath:@"@distinctUnionOfObjects.category"];
    
//    Creating sub array based on category
    NSMutableArray *tempGroup = [NSMutableArray array];
    for (NSString *category in _sectionTitle) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category = %@", category];
        NSArray *filterArray = [productList filteredArrayUsingPredicate:predicate];
        [tempGroup addObject:filterArray];
    }
    _groupPoductList = [tempGroup copy];
    
}

- (NSInteger) getNumberOfSection {
    return [_groupPoductList count];
}

- (NSInteger) getNumberOfRowForSection:(NSInteger) section {
    return [[_groupPoductList objectAtIndex:section] count];
}

- (Product *) getProductForSection:(NSInteger)section index:(NSInteger)index {
    return [[_groupPoductList objectAtIndex:section] objectAtIndex:index];
}

- (NSString *) getTitleForSection:(NSInteger) section {
    return [_sectionTitle objectAtIndex:section];
}

@end
