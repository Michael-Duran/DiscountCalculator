//
//  MDViewController.m
//  DiscountCalculator
//
//  Created by Michael on 2/20/14.
//  Copyright (c) 2014 Macbook Air. All rights reserved.
//

#import "MDViewController.h"
//#import "MDCalculator.h"

//@interface MDViewController ()

//@end




@implementation MDViewController

@synthesize priceInput;
@synthesize dollarsOffInput;
@synthesize discountPercentInput;
@synthesize additionalDiscountInput;
@synthesize taxPercentageInput;
@synthesize OrigPriceLabel;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"MDViewController was loaded");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Hide keyboard when return key pressed
- (IBAction)textFieldExit:(id)sender {
    [sender resignFirstResponder];
}

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

// Check if Price Field is empty or not
// When Calculate Button pressed, needs to display Original Price and Discount Price
// Get both values passed from CalDiscount class
- (IBAction)CalculateButton:(id)sender {
    if ([priceInput.text length] == 0)
    {
        NSLog( @"Price is empty!");
        priceInput.text = 0;
    }
    else
    {
        [DiscountInfo mainInfo];
        [DiscountInfo setDiscountInfo: priceInput.text = 0: dollarsOffInput.text = 0: discountPercentInput.text = 0: additionalDiscountInput.text = 0: taxPercentageInput.text = 0];
        
        OrigPriceLabel.text = [DiscountInfo calcPrice];
    }
    
}

@end
