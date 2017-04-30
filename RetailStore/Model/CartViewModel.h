//
//  CartViewModel.h
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ProductManagedObject;

@interface CartViewModel : NSObject

- (instancetype) initWithDB;
- (void) updateData;

- (NSInteger) getNumberOfSection;
- (NSInteger) getNumberOfRowForSection:(NSInteger) section;
- (ProductManagedObject *) getProductForSection:(NSInteger) section index:(NSInteger) index;
- (void) deleteProductForSection:(NSInteger) section index:(NSInteger) index;
- (NSString *) getTableViewFooterMsg;

@end
