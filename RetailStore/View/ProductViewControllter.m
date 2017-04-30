//
//  ProductViewControllter.m
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import "ProductViewControllter.h"
#import "ProductDetailViewController.h"
#import "DataAPIs.h"
#import "ProductViewModel.h"
#import "Product.h"

static NSString *CellIdentifier = @"ProductCell";
static CGFloat CellHeight = 50.0f;
static CGFloat TableViewSectionHeaderHeight = 30.0f;
static CGFloat TableViewSectionFooterHeight = 0.0f;

@interface ProductViewControllter () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) ProductViewModel *productViewModel;
@property (weak, nonatomic) IBOutlet UITableView *productTableView;

@end

@implementation ProductViewControllter

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchProductListAndInitViewModel];
    [self initView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark instance helper method

- (void) fetchProductListAndInitViewModel {
    NSArray *productList = [DataAPIs getData];
    _productViewModel = [[ProductViewModel alloc] initWithList:productList];
}

- (void) initView {
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.title = NSLocalizedString(@"ProductViewController_title", @"ProductViewController_title");
    
    self.title = NSLocalizedString(@"ProductViewController_title", @"ProductViewController_title");
    [[self.tabBarController.viewControllers objectAtIndex:1] setTitle:NSLocalizedString(@"CartViewController_title", @"CartViewController_title")];
    _productTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

# pragma mark tableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_productViewModel getNumberOfSection];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_productViewModel getNumberOfRowForSection:section];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return  [_productViewModel getTitleForSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Product *product = [_productViewModel getProductForSection:indexPath.section index:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = product.name;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return TableViewSectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return TableViewSectionFooterHeight;
}

# pragma mark tableView delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Product *product = [_productViewModel getProductForSection:indexPath.section index:indexPath.row];
    ProductDetailViewController *productDetailViewController = [[ProductDetailViewController alloc] initWithProduct:product];
    [self.navigationController pushViewController:productDetailViewController animated:YES];
    
}


@end
