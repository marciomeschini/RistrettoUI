//
//  SamplePickerViewController.m
//  FWTGridTableViewController_Test
//
//  Created by Marco Meschini on 7/17/12.
//  Copyright (c) 2012 Futureworkshops. All rights reserved.
//

#import "RistrettoTableViewController.h"
#import "RistrettoTableViewCell.h"
#import "UIViewController+Ristretto.h"
#import "UIColor+Ristretto.h"
#import "UIImage+Ristretto.h"
#import "UIFont+Ristretto.h"
#import "RistrettoSampleDescriptor.h"

@interface RistrettoTableViewController ()
@property (nonatomic, readwrite, retain) id tableHeaderView;
@property (nonatomic, readwrite, assign) UIEdgeInsets tableHeaderInsets;
@end

@implementation RistrettoTableViewController

- (void)dealloc
{
    self.didSelectCellBlock = nil;
    self.configureCellBlock = nil;
    self.tableHeaderView = nil;
    self.items = nil;
    [super dealloc];
}

- (void)loadView
{
    [super loadView];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.rowHeight = 52.0f;
    self.tableView.tableFooterView = [[[UIView alloc] init] autorelease];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.configureCellBlock = ^(RistrettoTableViewController *vc, UITableViewCell *cell, NSIndexPath *indexPath, id item){
        cell.textLabel.text = [item title];
    };
    
    self.didSelectCellBlock = ^(RistrettoTableViewController *vc, UITableViewCell *cell, NSIndexPath *indexPath, id item){
        UIViewController *newVC = nil;
        if ([item instance])
            newVC = [item instance];
        else
            newVC = [[[NSClassFromString([item className]) alloc] init] autorelease];
        
        newVC.title = [item title];
        [vc.navigationController pushViewController:newVC animated:YES];
    };
    
    [self Ristretto_enableBackButton];
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
        cell = [[[RistrettoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    
    id item = [self.items objectAtIndex:indexPath.row];
    if (self.configureCellBlock) self.configureCellBlock(self, cell, indexPath, item);

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self.items objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (self.didSelectCellBlock) self.didSelectCellBlock(self, cell, indexPath, item);
}

#pragma mark - Public
- (void)setTableHeaderView:(UIView *)view insets:(UIEdgeInsets)insets
{
    self.tableHeaderView = view;
    self.tableHeaderInsets = insets;
    
    CGRect bounds = view.bounds;
    CGRect frame = view.frame;
    frame.origin = (CGPoint){insets.left, insets.top};
    [self.tableHeaderView setFrame:frame];
    
    UIEdgeInsets theInsets = insets;
    theInsets.top *= -1;
    theInsets.left *= -1;
    theInsets.bottom *= -1;
    theInsets.right *= -1;
    CGRect containerFrame = UIEdgeInsetsInsetRect(bounds, theInsets);
    UIView *containerView = [[[UIView alloc] initWithFrame:containerFrame] autorelease];
//    containerView.layer.borderWidth = 1.0f;
    [containerView addSubview:self.tableHeaderView];
    self.tableView.tableHeaderView = containerView;
}

//+ (UINavigationController *)navigationControllerWithRootViewController:(UIViewController *)viewController
//{
//    UINavigationController *nc = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
//    
//    //
//    [nc.navigationBar setBackgroundImage:[UIImage Ristretto_navigationBarBackgroundImage] forBarMetrics:UIBarMetricsDefault];
//    [nc.navigationBar setShadowImage:[[[UIImage alloc] init] autorelease]];
//    NSDictionary *titleAttributes = @{UITextAttributeTextColor : [UIColor Ristretto_redColor],
//                                      UITextAttributeTextShadowColor : [UIColor clearColor],
//                                      UITextAttributeFont : [UIFont Ristretto_lightFontOfSize:22]};
//    [nc.navigationBar setTitleTextAttributes:titleAttributes];
//    
//    return nc;
//}

@end
