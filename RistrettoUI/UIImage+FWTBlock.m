//
//  UIImage+FWTBlock.m
//  TestOnSmartTableViewCell
//
//  Created by Marco Meschini on 04/02/2013.
//  Copyright (c) 2013 Marco Meschini. All rights reserved.
//

#import "UIImage+FWTBlock.h"

@implementation UIImage (FWTBlock)

+ (UIImage *)fwt_imageWithSize:(CGSize)size block:(void(^)(CGContextRef))block
{
    return [[self class] fwt_imageWithSize:size opaque:NO scale:.0f block:block];
}

+ (UIImage *)fwt_imageWithSize:(CGSize)size opaque:(BOOL)opaque block:(void (^)(CGContextRef))block
{
    return [[self class] fwt_imageWithSize:size opaque:opaque scale:.0f block:block];
}

+ (UIImage *)fwt_imageWithSize:(CGSize)size opaque:(BOOL)opaque scale:(CGFloat)scale block:(void (^)(CGContextRef))block
{
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (block) block(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)fwt_resizableImageWithSize:(CGSize)size capInsets:(UIEdgeInsets)capInsets block:(void(^)(CGContextRef))block
{
    UIImage *image = [[self class] fwt_imageWithSize:size block:block];
    return [image resizableImageWithCapInsets:capInsets];
}

@end
