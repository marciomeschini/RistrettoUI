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

@implementation UINavigationController (Ristretto)

+ (id)Ristretto_navigationControllerWithRootViewController:(UIViewController *)viewController
{
    UINavigationController *nc = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
    
    //
    [nc.navigationBar setBackgroundImage:[UIImage Ristretto_navigationBarBackgroundImage] forBarMetrics:UIBarMetricsDefault];
    [nc.navigationBar setShadowImage:[[[UIImage alloc] init] autorelease]];
    NSDictionary *titleAttributes = @{UITextAttributeTextColor : [UIColor Ristretto_redColor],
                                      UITextAttributeTextShadowColor : [UIColor clearColor],
                                      UITextAttributeFont : [UIFont Ristretto_lightFontOfSize:22]};
    [nc.navigationBar setTitleTextAttributes:titleAttributes];
    
    return nc;
}

@end
