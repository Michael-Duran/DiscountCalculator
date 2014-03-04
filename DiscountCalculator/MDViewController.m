//
//  MDViewController.m
//  DiscountCalculator
//
//  Created by Michael on 2/20/14.
//  Copyright (c) 2014 Macbook Air. All rights reserved.
//

#import "MDViewController.h"
#import "MDQuartzView.h"

@implementation MDViewController

@synthesize priceInput;
@synthesize dollarsOffInput;
@synthesize discountPercentInput;
@synthesize additionalDiscountInput;
@synthesize taxPercentageInput;
@synthesize OrigPriceLabel;
@synthesize DiscountPriceLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"MDViewController was loaded");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*  This retracts the keyboard from the screen when anywhere besides the
    keyboard is pressed. 
 */
- (void)touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event
{
    NSLog( @"resigning first respond for inputTextField; Touch event!" );
    if ( ! [self isFirstResponder]) {
        if ([self.priceInput isFirstResponder]) {
            [self.priceInput resignFirstResponder];
        }
        if ([self.dollarsOffInput isFirstResponder]) {
            [self.dollarsOffInput resignFirstResponder];
        }
        if ([self.discountPercentInput isFirstResponder]) {
            [self.discountPercentInput resignFirstResponder];
        }
        if ([self.additionalDiscountInput isFirstResponder]) {
            [self.additionalDiscountInput resignFirstResponder];
        }
        if ([self.taxPercentageInput isFirstResponder]) {
            [self.taxPercentageInput resignFirstResponder];
        }
    }
}

/*  When Calculate button is pressed, if nothing is entered, the price will
    be set to zero. Next all the inputs are passed to a class where the info
    is kept. Then calculations are done to get the original and discount price
    and the corresponding labels are updated to show this.
 */
- (IBAction)CalculateButton:(id)sender
{
    if ([priceInput.text length] == 0){
        priceInput.text = 0;
    }
    else{
        [DiscountInfo mainInfo];
        [DiscountInfo setDiscountInfo:  priceInput.text:
                                        dollarsOffInput.text:
                                        discountPercentInput.text:
                                        additionalDiscountInput.text:
                                        taxPercentageInput.text];
        [DiscountInfo calcPrice];
        
        OrigPriceLabel.text = [DiscountInfo calcPrice];
        DiscountPriceLabel.text = [DiscountInfo calcDiscountPrice];
    }
}
@end
