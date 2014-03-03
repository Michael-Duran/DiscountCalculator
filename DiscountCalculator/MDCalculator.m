//
//  MDCalculator.m
//  DiscountCalculator
//
//  Created by Michael on 2/28/14.
//  Copyright (c) 2014 Macbook Air. All rights reserved.
//

#import "MDCalculator.h"
#import "DiscountInfo.h"

static DiscountInfo* _mainInfo;

@implementation MDCalculator

+ (DiscountInfo*) mainInfo
{
    if(_mainInfo == nil)
    {
        _mainInfo = [[DiscountInfo alloc] init];
    }
    
    return _mainInfo;
}

- (NSObject*) setDiscountInfo: (float) price : (float) dollarsOff : (float) discount : (float) additionalDiscount : (float) tax
{
    DiscountInfo* inputInfo = [[DiscountInfo alloc] init];
    inputInfo.price = price;
    inputInfo.dollarsOff = dollarsOff;
    inputInfo.discount = discount;
    inputInfo.additionalDiscount = additionalDiscount;
    inputInfo.tax = tax;
    
    return inputInfo;
    
}

- (NSObject*) calcPrice: (NSObject*) userInput
{
    return self;
}

//DiscountInfo* temp = [[temp alloc] init];

// - (double) calculate:(NSString *)price{
//     return 12.1;
// }


@end
