//
//  MDCalculator.h
//  DiscountCalculator
//
//  Created by Michael on 2/28/14.
//  Copyright (c) 2014 Macbook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiscountInfo.h"

@interface MDCalculator : NSObject

- (NSObject*) setDiscountInfo: (float) price : (float) dollarsOff : (float) discount : (float) additionalDiscount : (float) tax;

- (NSObject*) calcPrice: (NSObject*) userInput;
//- (double) calculate : (NSString*) price;

+ (DiscountInfo*) mainInfo;



@end
