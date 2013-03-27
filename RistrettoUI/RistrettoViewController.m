//
//  RistrettoViewController.m
//  RistrettoUI
//
//  Created by Marco Meschini on 27/03/2013.
//  Copyright (c) 2013 Marco Meschini. All rights reserved.
//

#import "RistrettoViewController.h"
#import "UIViewController+Ristretto.h"

@implementation RistrettoViewController

- (void)loadView
{
    [super loadView];
    
    [self Ristretto_enableBackButton];
}

@end
