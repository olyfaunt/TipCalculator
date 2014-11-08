//
//  ViewController.m
//  TipCalculator
//
//  Created by Audrey Jun on 2014-10-17.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "ViewController.h"
#define OK_CHARS @"0123456789."

@interface ViewController ()

@property (nonatomic,retain) UIAlertView *alertView;

@end

@implementation ViewController

@synthesize alertView, billAmountTextField, tipPercentageTextField, peopleTextField;


- (void)viewDidLoad {
    [super viewDidLoad];
    billAmountTextField.keyboardType = UIKeyboardTypeDecimalPad;
    tipPercentageTextField.keyboardType = UIKeyboardTypeDecimalPad;
    peopleTextField.keyboardType = UIKeyboardTypeDecimalPad;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length >= 10 && range.length == 0)
        return NO;
    // Only characters in the NSCharacterSet you choose will insertable.
    NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890."] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
    return [string isEqualToString:filtered];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)calculateTip:(id)sender {

    [self.view endEditing:YES]; //resigns all firstResponders
    
    float people = [peopleTextField.text floatValue];
    
    float billb4tax = ([billAmountTextField.text floatValue])/people; //amount of bill before tax.
    float theTip = [tipPercentageTextField.text floatValue];
    
    float tax = billb4tax * 0.05;
    float customTip = theTip / 100;
    
    float billNumber = billb4tax*0.15;
    float customBillNumber = (customTip*billb4tax);
    
    float totalNumber = billb4tax + billNumber + tax;
    float totalNumber2 = billb4tax + customBillNumber + tax;
    
    _tipAmountLabel.text = [[NSString alloc] initWithFormat:@"%.2f", billNumber];
    _customTipAmountLabel.text = [[NSString alloc] initWithFormat:@"%.2f", customBillNumber];
    _totalLabel.text = [[NSString alloc] initWithFormat:@"%.2f", totalNumber];
    _totalLabel2.text = [[NSString alloc] initWithFormat:@"%.2f", totalNumber2];
}

- (IBAction)resetTextFields:(id)sender {
    billAmountTextField.text = nil;
    tipPercentageTextField.text = nil;
    peopleTextField.text = nil;
}

- (IBAction) clickedBackground
{
    [self.view endEditing:YES]; //make the view end editing!
}

@end
