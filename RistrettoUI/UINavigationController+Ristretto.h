//
//  UINavigationController+Ristretto.h
//  RistrettoUI
//
//  Created by Marco Meschini on 27/03/2013.
//  Copyright (c) 2013 Marco Meschini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Ristretto)

+ (id)Ristretto_navigationControllerWithRootViewController:(UIViewController *)viewController;
+ (id)Ristretto_navigationControllerWithRootViewController:(UIViewController *)viewController defaultHeaderEnabled:(BOOL)enabled;
@end
