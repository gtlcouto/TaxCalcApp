//
//  ViewController.m
//  TaxCalcApp
//
//  Created by Gustavo Couto on 2014-12-24.
//  Copyright (c) 2014 Gustavo Couto. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property double caTax, chiTax, nyTax;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.caTax = 7.5;
    self.chiTax = 9.25;
    self.nyTax = 4.5;

    self.priceTextField.delegate = self;
}

- (IBAction)onCalculateButtonTapped:(id)sender {
    //get intValue from the textfield string
    double tfValue = self.priceTextField.text.intValue;

    //print label with the result depending on the selected state
    switch(self.segmentedControl.selectedSegmentIndex){
        case 0:
        {
            double tax = tfValue * self.caTax / 100;
            self.resultLabel.text = [NSString stringWithFormat:@"Tax for this product is $%.2f", tax];
            break;
        }
        case 1:
        {
            double tax = tfValue * self.chiTax / 100;
            self.resultLabel.text = [NSString stringWithFormat:@"Tax for this product is $%.2f", tax];
            break;
        }
        case 2:
        {
            double tax = tfValue * self.nyTax / 100;
            self.resultLabel.text = [NSString stringWithFormat:@"Tax for this product is $%.2f", tax];
            break;
        }

    }//switch end

}//onCalculateButtonTapped end

#pragma mark - textField Delegate

- (BOOL) textField: (UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString: (NSString *)string {
    //return yes or no after comparing the characters

    // allow backspace
    if (!string.length)
    {
        return YES;
    }

    //for Decimal value start
        if ([textField.text rangeOfString:@"."].location == NSNotFound)
        {
            if ([string isEqualToString:@"."]) {
                return YES;
            }
        }
        else
        {
            if ([[textField.text substringFromIndex:[textField.text rangeOfString:@"."].location] length]>2)   // this allow 2 digit after decimal
            {
                UIAlertView *tooManyAlert =[[UIAlertView alloc] initWithTitle:@"Error" message:@"Too many decimals" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [tooManyAlert show];

                return NO;

            }
        }// Decimal value end

    // allow digit 0 to 9
    if ([string intValue])
    {
        return YES;
    }

    UIAlertView *invalidInputAlert =[[UIAlertView alloc] initWithTitle:@"Error" message:@"Only numbers and period are accepted in this field" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [invalidInputAlert show];

    return NO;

}


@end
