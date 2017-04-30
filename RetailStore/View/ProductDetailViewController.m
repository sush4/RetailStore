//
//  ProductDetailViewController.m
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "CoreDataUtil.h"
#include "Product.h"

@interface ProductDetailViewController ()

@property (nonatomic, strong) Product *product;
@property (nonatomic, assign) BOOL isAddToCart;

@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;

@end

@implementation ProductDetailViewController

- (instancetype) initWithProduct:(Product *)product isAddToCart:(BOOL)isAddToCart{
    self = [super init];
    if (self) {
        _product = product;
        _isAddToCart = isAddToCart;
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
    self.navigationItem.title = NSLocalizedString(@"productDetailController_title", @"productDetailController_title");
    
    if (_isAddToCart) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self
                                                  action:@selector(addToCart:)];
    }
    
    [_productImage setImage:[UIImage imageNamed:_product.image]];
    _productName.text = [NSString stringWithFormat:NSLocalizedString(@"product_name", @"Product_name"),_product.name];
    _productPrice.text = [NSString stringWithFormat:NSLocalizedString(@"product_price", nil),[_product.price stringValue]];
}

- (void) addToCart:(id) sender {
    NSLog(@"::: addToCart :::");
    [self showSuccessMsg];
    [[CoreDataUtil getCoreDataUtilInstance] addProductToCart:_product];
    
}

- (void) showSuccessMsg {
    
    NSString *message = NSLocalizedString(@"item_added", @"item_added");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    int duration = 0.5;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:YES completion:nil];
    });
}



@end
