//
//  UIImage+FWTRistrettoUI.m
//  FWTClock_Test
//
//  Created by Marco Meschini on 27/03/2013.
//  Copyright (c) 2013 Marco Meschini. All rights reserved.
//

#import "UIImage+Ristretto.h"
#import "UIImage+FWTBlock.h"
#import "UIColor+Ristretto.h"

@implementation UIImage (Ristretto)

+ (UIImage *)_RistrettoUI_roundedRectImageWithRadius:(CGFloat)radius color:(UIColor *)color
{
    CGFloat border = 1.0f;
    CGFloat cap = 1.0f;
    CGFloat width = radius*2.0f + cap + border*2.0f;
    CGSize size = CGSizeMake(width, width);
    CGFloat inset = radius+border;
    return [UIImage fwt_resizableImageWithSize:size
                                     capInsets:(UIEdgeInsets){inset, inset, inset, inset}
                                         block:^(CGContextRef ctx) {
                                             CGRect ctxRect = CGRectMake(.0f, .0f, size.width, size.height);
                                             CGRect availableRect = CGRectInset(ctxRect, 1, 1);
                                             UIBezierPath *bp = [UIBezierPath bezierPathWithRoundedRect:availableRect cornerRadius:radius];
                                             CGContextSetFillColorWithColor(ctx, color.CGColor);
                                             CGContextAddPath(ctx, bp.CGPath);
                                             CGContextDrawPath(ctx, kCGPathFill);
                                         }];
}

+ (UIImage *)Ristretto_navigationBarBackgroundImage
{
    return [UIImage fwt_imageWithSize:(CGSize){1.0f, 44.0f} opaque:YES block:^(CGContextRef ctx) {
        CGContextSetFillColorWithColor(ctx, [UIColor Ristretto_lightGrayColor].CGColor);
        CGContextFillRect(ctx, CGContextGetClipBoundingBox(ctx));
    }];
}

+ (UIImage *)Ristretto_roundedBackgroundImage
{
    CGFloat radius = 5.0f;
    return [UIImage _RistrettoUI_roundedRectImageWithRadius:radius color:[UIColor Ristretto_redColor]];
}

+ (UIImage *)Ristretto_roundedSelectedBackgroundImage
{
    CGFloat radius = 4.0f;
    return [UIImage _RistrettoUI_roundedRectImageWithRadius:radius color:[UIColor Ristretto_lightGrayColor]];
}

@end
