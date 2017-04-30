//
//  ProductDetailViewController.m
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import "ProductDetailViewController.h"
#include "Product.h"

@interface ProductDetailViewController ()

@property (nonatomic, strong) Product *product;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;

@end

@implementation ProductDetailViewController

- (instancetype) initWithProduct:(Product *)product {
    self = [super init];
    if (self) {
        _product = product;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self intiView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) intiView {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = NSLocalizedString(@"ProductDetailController_title", @"ProductDetailController_title");

    [_productImage setImage:[UIImage imageNamed:_product.image]];
    _productName.text = [NSString stringWithFormat:NSLocalizedString(@"Product_name", nil),_product.name];
    _productPrice.text = [NSString stringWithFormat:NSLocalizedString(@"Product_price", nil),[_product.price stringValue]];
}

@end
