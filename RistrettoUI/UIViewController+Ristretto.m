//
//  UIViewController+Ristretto.m
//  FWTClock_Test
//
//  Created by Marco Meschini on 27/03/2013.
//  Copyright (c) 2013 Marco Meschini. All rights reserved.
//

#import "UIViewController+Ristretto.h"
#import <objc/runtime.h>

@implementation UIViewController (Ristretto)

- (void)Ristretto_enableBackButton
{
    if (!self.navigationController) return;
    if (self.navigationController.viewControllers.count == 1) return;
    
    SEL selector = @selector(_didTapBackButton:);
    BOOL respondsToSelector = class_respondsToSelector([self class], selector);
    if (!respondsToSelector)
    {
        void* blk = ^(id self, SEL _cmd, id button) {
            [[self navigationController] popViewControllerAnimated:YES];
        };
        blk = Block_copy(blk);
        IMP imp = imp_implementationWithBlock(blk);
        class_addMethod([self class], selector, imp, "v@:@");
    }
    
    NSString *subclassName = @"__RistrettoBackButtonClass";
    Class buttonClass = NSClassFromString(subclassName);
    if (!buttonClass)
    {
        Class mySubclass = objc_allocateClassPair([UIButton class], [subclassName UTF8String], 0);
        objc_registerClassPair(mySubclass);
    }

    buttonClass = NSClassFromString(subclassName);
    if (!buttonClass) return;
    if (![self.navigationItem.leftBarButtonItem isKindOfClass:buttonClass])
    {
        UIButton *button = [[buttonClass alloc] init];
        UIImage *image = [UIImage imageNamed:@"button_back.png"];
        button.bounds = (CGRect){.0f, .0f, 40.0f, 32.0f};
        [button setImage:image forState:UIControlStateNormal];
        [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
        self.navigationItem.leftBarButtonItem = barButtonItem;
    }
}

@end
