//
//  ProductDetailViewController.h
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Product;

@interface ProductDetailViewController : UIViewController

- (instancetype) initWithProduct:(Product *)product;

@end
