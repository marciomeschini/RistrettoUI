//
//  UIImage+FWTBlock.h
//  TestOnSmartTableViewCell
//
//  Created by Marco Meschini on 04/02/2013.
//  Copyright (c) 2013 Marco Meschini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FWTBlock)

+ (UIImage *)fwt_imageWithSize:(CGSize)size block:(void(^)(CGContextRef))block;
+ (UIImage *)fwt_imageWithSize:(CGSize)size opaque:(BOOL)opaque block:(void (^)(CGContextRef))block;
+ (UIImage *)fwt_imageWithSize:(CGSize)size opaque:(BOOL)opaque scale:(CGFloat)scale block:(void (^)(CGContextRef))block;

+ (UIImage *)fwt_resizableImageWithSize:(CGSize)size capInsets:(UIEdgeInsets)capInsets block:(void(^)(CGContextRef))block;

@end
