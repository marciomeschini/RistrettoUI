//
//  UIColor+Ristretto.m
//  FWTClock_Test
//
//  Created by Marco Meschini on 27/03/2013.
//  Copyright (c) 2013 Marco Meschini. All rights reserved.
//

#import "UIColor+Ristretto.h"

@implementation UIColor (Ristretto)

+ (UIColor *)Ristretto_lightGrayColor
{
    return [UIColor colorWithWhite:.88f alpha:1.0f];
}

+ (UIColor *)Ristretto_darkGrayColor
{
    return [UIColor colorWithWhite:.27f alpha:1.0f];
}

+ (UIColor *)Ristretto_redColor
{
    return [UIColor colorWithRed:.74f green:.19f blue:.19f alpha:1.0f];
}

@end
