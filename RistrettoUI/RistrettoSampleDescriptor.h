//
//  RistrettoSampleDescriptor.h
//  RistrettoUI
//
//  Created by Marco Meschini on 27/03/2013.
//  Copyright (c) 2013 Marco Meschini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RistrettoSampleDescriptor : NSObject
@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) id instance;

+ (RistrettoSampleDescriptor *)descriptorWithTitle:(NSString *)title className:(NSString *)className;
+ (RistrettoSampleDescriptor *)descriptorWithTitle:(NSString *)title instance:(id)instance;

@end
