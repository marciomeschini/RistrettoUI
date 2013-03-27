//
//  RistrettoSampleDescriptor.m
//  RistrettoUI
//
//  Created by Marco Meschini on 27/03/2013.
//  Copyright (c) 2013 Marco Meschini. All rights reserved.
//

#import "RistrettoSampleDescriptor.h"

@implementation RistrettoSampleDescriptor

- (void)dealloc
{
    self.instance = nil;
    self.title = nil;
    self.className = nil;
    [super dealloc];
}

+ (RistrettoSampleDescriptor *)descriptorWithTitle:(NSString *)title className:(NSString *)className
{
    RistrettoSampleDescriptor *toReturn = [[[RistrettoSampleDescriptor alloc] init] autorelease];
    toReturn.title = title;
    toReturn.className = className;
    return toReturn;
}

+ (RistrettoSampleDescriptor *)descriptorWithTitle:(NSString *)title instance:(id)instance
{
    RistrettoSampleDescriptor *toReturn = [[[RistrettoSampleDescriptor alloc] init] autorelease];
    toReturn.title = title;
    toReturn.instance = instance;
    return toReturn;
}

@end
