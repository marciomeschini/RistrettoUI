//
//  RistrettoTableViewCell.m
//  FWTClock_Test
//
//  Created by Marco Meschini on 27/03/2013.
//  Copyright (c) 2013 Marco Meschini. All rights reserved.
//

#import "RistrettoTableViewCell.h"
#import "UIImage+Ristretto.h"
#import "UIFont+Ristretto.h"
#import "UIColor+Ristretto.h"

@implementation RistrettoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont Ristretto_mediumFontOfSize:18];
        self.textLabel.highlightedTextColor = [UIColor Ristretto_redColor];
        
        UIImageView *iv = [[[UIImageView alloc] initWithImage:[UIImage Ristretto_roundedBackgroundImage]] autorelease];
        self.backgroundView = iv;
        
        iv = [[[UIImageView alloc] initWithImage:[UIImage Ristretto_roundedSelectedBackgroundImage]] autorelease];
        self.selectedBackgroundView = iv;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect bgrFrame = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(4.0f, 40.0f, 3.0f, 40.0f));
    self.backgroundView.frame = bgrFrame;
    self.selectedBackgroundView.frame = bgrFrame;
}

@end
