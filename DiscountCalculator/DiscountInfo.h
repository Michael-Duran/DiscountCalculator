//
//  DiscountInfo.h
//  DiscountCalculator
//
//  Created by Michael on 3/1/14.
//  Copyright (c) 2014 Macbook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiscountInfo : NSObject

@property (nonatomic) double price;
@property (nonatomic) double dollarsOff;
@property (nonatomic) double discount;
@property (nonatomic) double additionalDiscount;
@property (nonatomic) double tax;

@property (readonly) float discountedPrice;
@property (readonly) float originalPrice;

- (float) discountedPrice;
- (float) originalPrice;

+ (DiscountInfo*) mainInfo;

// added from MDCalculator
+ (void) setDiscountInfo: (NSString*) priceInput : (NSString*) dollarsOffInput : (NSString*) discountInput : (NSString*) additionalDiscountInput : (NSString*) taxInput;

+ (NSString*) calcPrice;//: (NSObject*) userInput;



//+ (DiscountInfo*) mainInfo;

@end
