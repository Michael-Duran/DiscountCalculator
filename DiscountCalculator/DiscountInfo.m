//
//  DiscountInfo.m
//  DiscountCalculator
//
//  Created by Michael on 3/1/14.
//  Copyright (c) 2014 Macbook Air. All rights reserved.
//

#import "DiscountInfo.h"

static DiscountInfo* _mainInfo;



@implementation DiscountInfo



+ (DiscountInfo*) mainInfo
{
    if(_mainInfo == nil)
    {
        _mainInfo = [[DiscountInfo alloc] init];
    }
    
    return _mainInfo;
}

+ (void) setDiscountInfo: (NSString*) priceInput : (NSString*) dollarsOffInput : (NSString*) discountInput : (NSString*) additionalDiscountInput : (NSString*) taxInput
{
    //DiscountInfo* _mainInfo = [[DiscountInfo alloc] init];
    _mainInfo.price = [priceInput doubleValue];
    _mainInfo.dollarsOff = [dollarsOffInput doubleValue];
    _mainInfo.discount = [discountInput doubleValue];
    _mainInfo.additionalDiscount = [additionalDiscountInput doubleValue];
    _mainInfo.tax = [taxInput doubleValue];
    
    
}


+ (NSString*) calcPrice//: (NSObject*) userInput
{
    double temp = _mainInfo.price;
    
    temp *= 2;
    
    return [NSString stringWithFormat:@"%lf", temp];
}







/*  // moved to MDCalculator for now
+ (DiscountInfo*) mainInfo
{
    if(_mainInfo == nil)
    {
        _mainInfo = [[DiscountInfo alloc] init];
    }
    
    return _mainInfo;
}
 */
@end
