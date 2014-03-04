//
//  MDQuartzView.m
//  DiscountCalculator
//
//  Created by Michael on 3/3/14.
//  Copyright (c) 2014 Macbook Air. All rights reserved.
//

#import "MDQuartzView.h"
#import "discountInfo.h"

@implementation MDQuartzView

- (void)drawRect:(CGRect)rect {
    /*  Creates an instance of a class, and gets all information previously
        stored in the class by the viewController. */
    DiscountInfo* priceInformation;
    priceInformation = [DiscountInfo mainInfo];
    
    // initalizes the attributes needed for drawAtPoint:withAttributes
    NSDictionary* attr = [[NSDictionary alloc] init];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 2.0);
    
//===== Original Price =========================================================
    CGRect originalRec = CGRectMake(20, 20, 130, 400);
    CGContextAddRect(context, originalRec);
    CGContextStrokePath(context);
    
    // Sets rectangle with white fill color
    UIColor * color = [UIColor colorWithRed:131/255.0f green:71/255.0f blue:194/255.0f alpha:1.0f];
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, originalRec);
    
    // Display Original Price
    NSString* dispOrig = [[NSString alloc] initWithFormat:@"$%0.2f", priceInformation.originalPrice];
    [dispOrig drawAtPoint:CGPointMake(65, 185) withAttributes: attr];
    
//===== amountSaved ============================================================
    // Calcualate how much user saved, percentage and rectangle height
    double amountSaved = priceInformation.originalPrice - priceInformation.discountedPrice;
    double savedPerc = amountSaved / priceInformation.originalPrice;
    double savedRecHeight;
    //checks to see if it is a nan. a nan will return true with !=
    if(savedPerc != savedPerc){
        NSLog(@"savedPerc is not a number");
        savedRecHeight = 0;
        savedPerc = 0;
    }else{
        NSLog(@"savedPerc is: %lf", savedPerc);
        savedRecHeight = 400 * savedPerc;
    }
    
    CGRect subtractRec = CGRectMake(165,20,135, savedRecHeight);
    CGContextAddRect(context, subtractRec);
    CGContextStrokePath(context);
    
    // Sets rectangle with custom fill color
    color = [UIColor colorWithRed:131/255.0f green:197/255.0f blue:202/255.0f alpha:1.0f];
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, subtractRec);
    
    // Display the saved amount and percentage
    NSString* printSubtractDollars = [[NSString alloc] initWithFormat:@"$%0.2f", amountSaved];
    [printSubtractDollars drawAtPoint:CGPointMake(200, savedRecHeight / 2) withAttributes: attr];
    NSString* printSubtractPerc = [[NSString alloc] initWithFormat:@"%0.1f%%",savedPerc * 100];
    [printSubtractPerc drawAtPoint:CGPointMake(200,20 + savedRecHeight / 2) withAttributes: attr];
    
//===== discountPrice ============================================================
    
    // Compute Discount percentage and display location in its shape
    double discountPerc= priceInformation.discountedPrice / priceInformation.originalPrice;
    if(discountPerc != discountPerc){
        discountPerc = 0;
    }
    double discountRecHeight = 400 - savedRecHeight;
    
    CGRect discountRec = CGRectMake(165,20 + savedRecHeight,135,discountRecHeight);
    CGContextAddRect(context, discountRec);
    CGContextStrokePath(context);
   
    // Sets rectangle with custom fill color
    color = [UIColor colorWithRed:131/255.0f green:193/255.0f blue:65/255.0f alpha:1.0f];
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, discountRec);

    // Display Discount Price and percentage inside rectangle
    NSString* printDiscountDollars = [[NSString alloc] initWithFormat:@"$%0.2f", priceInformation.discountedPrice];
    [printDiscountDollars drawAtPoint:CGPointMake(200,savedRecHeight + discountRecHeight / 2) withAttributes: attr];
    NSString* printDiscountPerc = [[NSString alloc] initWithFormat:@"%0.1f%%",discountPerc * 100];
    [printDiscountPerc drawAtPoint:CGPointMake(200,20 + savedRecHeight + discountRecHeight / 2) withAttributes: attr];
}

@end
