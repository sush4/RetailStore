//
//  ProductViewModel.h
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Product;

@interface ProductViewModel : NSObject

- (instancetype) initWithList:(NSArray *)productList;

- (NSInteger) getNumberOfSection;
- (NSInteger) getNumberOfRowForSection:(NSInteger) section;
- (Product *) getProductForSection:(NSInteger) section index:(NSInteger) index;
- (NSString *) getTitleForSection:(NSInteger) section;

@end
