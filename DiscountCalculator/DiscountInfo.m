//
//  DiscountInfo.m
//  DiscountCalculator
//
//  Created by Michael on 3/1/14.
//  Copyright (c) 2014 Macbook Air. All rights reserved.
//

#import "DiscountInfo.h"

//static DiscountInfo* _mainInfo;

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
    NSLog(@"price is %lf", _mainInfo.price);
    _mainInfo.dollarsOff = [dollarsOffInput doubleValue];
    _mainInfo.discount = [discountInput doubleValue];
    _mainInfo.additionalDiscount = [additionalDiscountInput doubleValue];
    _mainInfo.tax = [taxInput doubleValue];
    
}

+ (NSString*) calcPrice
{
    _mainInfo.originalPrice = _mainInfo.price + ((_mainInfo.price * _mainInfo.tax) / 100);
    
    //_mainInfo.discountedPrice = ((_mainInfo.originalPrice - _mainInfo.dollarsOff) * (1 - (_mainInfo.discount/100))) * (1 - _mainInfo.additionalDiscount);
    

    return [NSString stringWithFormat:@"%0.2lf", _mainInfo.originalPrice];
}

+ (NSString*) calcDiscountPrice
{
    _mainInfo.discountedPrice = ((_mainInfo.originalPrice - _mainInfo.dollarsOff) * (1 - (_mainInfo.discount/100))) * (1 - (_mainInfo.additionalDiscount)/100);
    
    
    return [NSString stringWithFormat:@"%0.2lf", _mainInfo.discountedPrice];
}

@end
