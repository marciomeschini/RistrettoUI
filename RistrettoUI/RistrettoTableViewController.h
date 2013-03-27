//
//  SamplePickerViewController.h
//  FWTGridTableViewController_Test
//
//  Created by Marco Meschini on 7/17/12.
//  Copyright (c) 2012 Futureworkshops. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RistrettoTableViewController;

typedef void(^RistrettoConfigureCellBlock)(RistrettoTableViewController *vc, UITableViewCell *cell, NSIndexPath *indexPath, id item);
typedef void(^RistrettoDidSelectCellBlock)(RistrettoTableViewController *vc, UITableViewCell *cell, NSIndexPath *indexPath, id item);

@interface RistrettoTableViewController : UITableViewController
@property (nonatomic, retain) NSArray *items;
@property (nonatomic, readonly, retain) id tableHeaderView;
@property (nonatomic, readonly, assign) UIEdgeInsets tableHeaderInsets;

@property (nonatomic, copy) RistrettoConfigureCellBlock configureCellBlock;
@property (nonatomic, copy) RistrettoDidSelectCellBlock didSelectCellBlock;

- (void)setTableHeaderView:(UIView *)view insets:(UIEdgeInsets)insets;

+ (UINavigationController *)navigationControllerWithRootViewController:(UIViewController *)viewController;

@end


@interface RistrettoSampleDescriptor : NSObject
@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) id instance;

+ (RistrettoSampleDescriptor *)descriptorWithTitle:(NSString *)title className:(NSString *)className;
+ (RistrettoSampleDescriptor *)descriptorWithTitle:(NSString *)title instance:(id)instance;

@end