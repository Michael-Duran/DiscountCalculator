//
//  MDViewController.h
//  DiscountCalculator
//
//  Created by Michael on 2/20/14.
//  Copyright (c) 2014 Macbook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscountInfo.h"


@interface MDViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *priceInput;
@property (strong, nonatomic) IBOutlet UITextField *dollarsOffInput;
@property (strong, nonatomic) IBOutlet UITextField *discountPercentInput;
@property (strong, nonatomic) IBOutlet UITextField *additionalDiscountInput;
@property (strong, nonatomic) IBOutlet UITextField *taxPercentageInput;
@property (strong, nonatomic) IBOutlet UILabel *OrigPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *DiscountPriceLabel;

- (IBAction)CalculateButton:(id)sender;

@end
