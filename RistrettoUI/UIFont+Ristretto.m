//
//  UIFont+Ristretto.m
//  FWTClock_Test
//
//  Created by Marco Meschini on 27/03/2013.
//  Copyright (c) 2013 Marco Meschini. All rights reserved.
//

#import "UIFont+Ristretto.h"

@implementation UIFont (Ristretto)

+ (UIFont *)Ristretto_lightFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:fontSize];
}

+ (UIFont *)Ristretto_mediumFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:fontSize];
}

@end
