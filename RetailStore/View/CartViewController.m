//
//  CartViewController.m
//  RetailStore
//
//  Created by Sushant kumar on 30/04/17.
//  Copyright © 2017 Sushant kumar. All rights reserved.
//

#import "CartViewController.h"
#import "ProductDetailViewController.h"
#import "CartViewModel.h"
#import "CoreDataUtil.h"
#import "ProductManagedObject.h"
#import "Product.h"

static NSString *CellIdentifier = @"CartCell";
static CGFloat CellHeight = 50.0f;
static CGFloat TableViewSectionHeaderHeight = 0.0f;
static CGFloat TableViewSectionFooterHeight = 30.0f;

@interface CartViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) CartViewModel *cartViewModel;
@property (weak, nonatomic) IBOutlet UITableView *cartTableView;
@property (nonatomic, assign) BOOL isCartEditMode;

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    _cartViewModel = [[CartViewModel alloc] initWithDB];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_cartViewModel updateData];
    [_cartTableView reloadData];
}


- (void) initView {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = NSLocalizedString(@"cartViewController_title", @"cartViewController_title");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                              target:self
                                              action:@selector(editCart:)];
    
}

- (void) editCart:(id) sender {
    
    _isCartEditMode = !_isCartEditMode;
    if (_isCartEditMode) {
        [_cartTableView setEditing:_isCartEditMode animated:YES];
    } else {
        [_cartTableView setEditing:_isCartEditMode animated:YES];
    }
    
}

# pragma mark tableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_cartViewModel getNumberOfSection];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_cartViewModel getNumberOfRowForSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    ProductManagedObject *productManagedObject = [_cartViewModel getProductForSection:indexPath.section index:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = productManagedObject.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:NSLocalizedString(@"price", @"price"),productManagedObject.price];
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

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [_cartViewModel getTableViewFooterMsg];
}

# pragma mark tableView delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductManagedObject *productManagedObject = [_cartViewModel getProductForSection:indexPath.section index:indexPath.row];
    Product *product = [[Product alloc] initWithProductManagedObject:productManagedObject];
    ProductDetailViewController *productDetailViewController = [[ProductDetailViewController alloc] initWithProduct:product isAddToCart:NO];
    [self.navigationController pushViewController:productDetailViewController animated:YES];
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath { //implement the delegate method
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_cartViewModel deleteProductForSection:indexPath.section index:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView footerViewForSection:indexPath.section].textLabel.text = [self tableView:tableView titleForFooterInSection:indexPath.section];
        
        NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:indexPath.section];
        [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
    }   
}

@end
