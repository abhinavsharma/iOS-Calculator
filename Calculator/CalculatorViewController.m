//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Adi Dahiya on 09/30/2012.
//  Copyright (c) 2012 Adi Dahiya. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Calculator.h"

@interface CalculatorViewController ()
// Private properties & methods go here

@property (nonatomic) BOOL isDisplayingResult;
@property (nonatomic) BOOL lastEnteredOperation;
@property (nonatomic, strong) Calculator *calculator;

@end


@implementation CalculatorViewController

@synthesize display = _display;
@synthesize isDisplayingResult = _isDisplayingResult;
@synthesize lastEnteredOperation = _lastEnteredOperation;
@synthesize calculator = _calculator;

- (IBAction) digitPressed:(UIButton *)sender
{
  NSString *digit = sender.currentTitle;

  if (self.isDisplayingResult) {
    // Start off new calculator input by simply displaying digit
    self.display.text = digit;
  } else {
    // Append digit to output display
    self.display.text = [self.display.text stringByAppendingString:digit];
  }
  
  self.isDisplayingResult = false;
  self.lastEnteredOperation = false;
}

- (IBAction) operationPressed:(UIButton *)sender
{
  NSString *operation = sender.currentTitle;
  
  if (!self.lastEnteredOperation) {
    self.display.text = [self.display.text stringByAppendingString:operation];
    self.lastEnteredOperation = true;
  }
}

- (IBAction) backspace:(id)sender
{
  NSString *displayText = self.display.text;
  
  if ([displayText length] > 0) {
    displayText = [displayText substringToIndex:[displayText length] - 1];
  }
}

- (IBAction) printResult:(id)sender
{
  NSArray *tokens = [self.display.text componentsSeparatedByString:@""];
  // NSString *result = [calculate tokens:tokens];
  
  if (self.lastEnteredOperation) {
    self.display.text = @"RESULT";
    self.isDisplayingResult = true;
  } else {
    
  }
}


@end
