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

@synthesize calDiscountPrice;
@synthesize calOriginalPrice;



/*

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"initWithFrame");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"initWithCoder");
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.opaque = YES;
        self.clearsContextBeforeDrawing = YES;
    }
    return self;
}

*/


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    DiscountInfo* priceInformation;
    priceInformation = [DiscountInfo mainInfo];
    
    // Get the drawing context
    CGContextRef context = UIGraphicsGetCurrentContext();
    // Drawing with a white stroke color
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    // Draw all rectangle with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0);
    // Set display font and size
    UIFont * font = nil;
    font = [UIFont systemFontOfSize:15.0];
    
    //------------------------------------Draw Original Price rectangle----------------------------------------
    
    CGRect originalRec = CGRectMake(20, 20, 135, 375);
    // Adds a rectangular path
    CGContextAddRect(context, originalRec);
    // Paints a line along the current path
    CGContextStrokePath(context);
    // Sets rectangle with white fill color
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    // Paints rectangle using white fill color
    CGContextFillRect(context, originalRec);
    
    // Sets current fill color to black
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    // Set instance variable to store Original Price
    NSString* printOriginalPrice = [[NSString alloc] initWithFormat:@"$%0.2f", priceInformation.originalPrice];//calOriginalPrice];
    // Display Original Price
    [printOriginalPrice drawAtPoint:CGPointMake(65, 185) withAttributes:<#(NSDictionary *)#>];//withFont:font];
    
    //--------------------------------------Draw subtracted rectangle--------------------------------------------
    
    
    
    // Calcualate how much user saved from original price
    double subtractAmount = priceInformation.originalPrice - priceInformation.discountedPrice;
    // Calculate saved percentage
    double subtractPerc =  subtractAmount / priceInformation.originalPrice;
    // Calculate dispaly location
    double subtractRecHeight = 375 * subtractPerc;
    
    CGRect subtractRec = CGRectMake(156,20,135,subtractRecHeight);
    // Adds a rectangular path
    CGContextAddRect(context, subtractRec);
    // Paints a line along the current path
    CGContextStrokePath(context);
    // Sets rectangle with white fill color
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    // Panits rectangle using while fill color
    CGContextFillRect(context, subtractRec);
    
    // Sets current fill color to black
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    // Set instance variable to store subtracted amount
    NSString* printSubtractDollars = [[NSString alloc] initWithFormat:@"$%0.2f",subtractAmount];
    // Display the subtracted price
    [printSubtractDollars drawAtPoint:CGPointMake(200, subtractRecHeight / 2) withFont:font];
    // Set instance variable to store subtacted amount in percentage
    NSString* printSubtractPerc = [[NSString alloc] initWithFormat:@"%0.1f%%",subtractPerc * 100];
    // Display the subtracted percentage
    [printSubtractPerc drawAtPoint:CGPointMake(200,20 + subtractRecHeight / 2) withFont:font];
    
    //----------------------------------------Draw Discount Price rectangle----------------------------------------
    
    // Compute Discount percentage and display location in its shape
    double discountPerc= priceInformation.discountedPrice / priceInformation.originalPrice;
    double discountRecHeight = 375 - subtractRecHeight;
    
    CGRect discountRec = CGRectMake(156,20 + subtractRecHeight,135,discountRecHeight);
    // Adds a rectangular path
    CGContextAddRect(context, discountRec);
    // Paints a line along the current path
    CGContextStrokePath(context);
    // Sets rectangle with white fill color
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    // Paints rectangle using white fill color
    CGContextFillRect(context, discountRec);
    
    // Sets current fill color to black
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    // Set instance variable to store Discount Price
    NSString* printDiscountDollars = [[NSString alloc] initWithFormat:@"$%0.2f", priceInformation.discountedPrice];
    // Display Discount Price in the middle of rectangle
    [printDiscountDollars drawAtPoint:CGPointMake(200,subtractRecHeight + discountRecHeight / 2) withFont:font];
    // Set instance variable to store Discount Price percentage
    NSString* printDiscountPerc = [[NSString alloc] initWithFormat:@"%0.1f%%",discountPerc * 100];
    // Display Discount Price percentage in the middle of rectangle, but a little below Discount Price
    [printDiscountPerc drawAtPoint:CGPointMake(200,20 + subtractRecHeight + discountRecHeight / 2) withFont:font];
    
}

@end
