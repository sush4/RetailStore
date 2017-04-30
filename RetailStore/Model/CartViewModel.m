//
//  CartViewModel.m
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import "CartViewModel.h"
#import "CoreDataUtil.h"

@interface CartViewModel()

@property (nonatomic, strong) NSArray *products;

@end

@implementation CartViewModel

- (instancetype) initWithDB {
    self = [super init];
    if (self) {
        _products = [[CoreDataUtil getCoreDataUtilInstance] getCartList];
    }
    return self;
}

- (void) updateData {
    _products = [[CoreDataUtil getCoreDataUtilInstance] getCartList];
}

- (NSInteger) getNumberOfSection {
    return 1;
}

- (NSInteger) getNumberOfRowForSection:(NSInteger) section {
    return [_products count];
}

- (ProductManagedObject *) getProductForSection:(NSInteger) section index:(NSInteger) index {
    return [_products objectAtIndex:index];
}

- (void) deleteProductForSection:(NSInteger) section index:(NSInteger) index{
    ProductManagedObject *productManagedObject = [_products objectAtIndex:index];
    [[CoreDataUtil getCoreDataUtilInstance] deleteProductFromCart:productManagedObject];
    [self updateData];
}

- (NSString *) getTableViewFooterMsg {
    NSString *msg;
    if ([_products count] == 0) {
        msg = NSLocalizedString(@"empty_cart", @"empty_cart");
    } else {
        NSNumber *sum = [_products valueForKeyPath:@"@sum.self.price"];
        msg = [NSString stringWithFormat:NSLocalizedString(@"total", @"total"),sum];
    }
    return msg;
}

@end
