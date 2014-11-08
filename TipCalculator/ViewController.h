//
//  ViewController.h
//  TipCalculator
//
//  Created by Audrey Jun on 2014-10-17.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (weak, nonatomic) IBOutlet UITextField *peopleTextField;

- (IBAction)calculateTip:(id)sender;
- (IBAction)resetTextFields:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *customTipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel2;

- (IBAction) clickedBackground;

@end

