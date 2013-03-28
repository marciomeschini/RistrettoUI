//
//  UINavigationController+Ristretto.m
//  RistrettoUI
//
//  Created by Marco Meschini on 27/03/2013.
//  Copyright (c) 2013 Marco Meschini. All rights reserved.
//

#import "UINavigationController+Ristretto.h"
#import "UIImage+Ristretto.h"
#import "UIFont+Ristretto.h"
#import "UIColor+Ristretto.h"
#import "RistrettoTableViewController.h"

@implementation UINavigationController (Ristretto)

+ (id)Ristretto_navigationControllerWithRootViewController:(UIViewController *)viewController
{
    return [[self class] Ristretto_navigationControllerWithRootViewController:viewController defaultHeaderEnabled:NO];
}

+ (id)Ristretto_navigationControllerWithRootViewController:(UIViewController *)viewController defaultHeaderEnabled:(BOOL)enabled
{
    UINavigationController *nc = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
    
    //
    [nc.navigationBar setBackgroundImage:[UIImage Ristretto_navigationBarBackgroundImage] forBarMetrics:UIBarMetricsDefault];
    [nc.navigationBar setShadowImage:[[[UIImage alloc] init] autorelease]];
    NSDictionary *titleAttributes = @{UITextAttributeTextColor : [UIColor Ristretto_redColor],
                                      UITextAttributeTextShadowColor : [UIColor clearColor],
                                      UITextAttributeFont : [UIFont Ristretto_lightFontOfSize:22]};
    [nc.navigationBar setTitleTextAttributes:titleAttributes];
    
    //
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *title = [infoDictionary valueForKey:@"CFBundleDisplayName"];
    viewController.title = title;
    
    //
    if (enabled && [viewController isKindOfClass:[RistrettoTableViewController class]])
    {
        //
        UIView *headerView = [[[UIView alloc] initWithFrame:(CGRect){.0f, .0f, 240.0f, 200.0f}] autorelease];
        [(RistrettoTableViewController *)viewController setTableHeaderView:headerView insets:(UIEdgeInsets){58.0f, 40.0f, 45.0f, 40.0f}];
        
        UIImageView *iconView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_overlayview.png"]] autorelease];
        iconView.center = CGPointMake(CGRectGetMidX(headerView.bounds), iconView.center.y);
        [headerView addSubview:iconView];
        
        UILabel *label = [[[UILabel alloc] init] autorelease];
        label.text = @"Choose a sample:";
        label.font = [UIFont Ristretto_lightFontOfSize:18.0f];
        label.textColor = [UIColor Ristretto_darkGrayColor];
        [label sizeToFit];
        label.center = CGPointMake(CGRectGetMidX(headerView.bounds), CGRectGetHeight(headerView.bounds)-CGRectGetHeight(label.bounds)*.5f);
        [headerView addSubview:label];
    }
    
    return nc;
}

@end
