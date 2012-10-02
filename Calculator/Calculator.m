//
//  Calculator.m
//  Calculator
//
//  Created by Adi Dahiya on 09/30/2012.
//  Copyright (c) 2012 Adi Dahiya. All rights reserved.
//

#import "Calculator.h"

@interface Calculator ()

@end


@implementation Calculator

- (NSNumber *) calculate:(NSString *)operationString
{
  // Parse out operations and double values from input
  NSCharacterSet *operationSet = [NSCharacterSet characterSetWithCharactersInString:@"+-×÷"];
  NSCharacterSet *digitSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
  NSMutableArray *valueStrings = [[operationString componentsSeparatedByCharactersInSet:operationSet] mutableCopy];
  NSMutableArray *operations= [[operationString componentsSeparatedByCharactersInSet:digitSet] mutableCopy];
  
  double values[valueStrings.count];
  int i = 0, k = 0;
  
  for (NSString *val in valueStrings) {
    // NSLog(@"got value: %f", [val doubleValue]);
    values[i] = [val doubleValue];
    i++;
  }
  
  for (NSString *op in operations) {
    if ([op isEqualToString:@""]) continue;
    
    // Do some order of operations magic
    if ([op isEqualToString:@"×"]) {
      values[k+1] = values[k] * values[k+1];
      values[k] = 0;
    } else if ([op isEqualToString:@"÷"]) {
      // Break early if divide by zero
      if (values[k+1] == 0) return [NSNumber numberWithDouble:0];
      
      values[k+1] = values[k] / values[k+1];
      values[k] = 0;
    } else if ([op isEqualToString:@"-"]) {
      values[k+1] = (-1) * values[k+1];
    }
    
    k++;
  }
  
  double result = 0;
  
  for (int j = 0; j < valueStrings.count; j++) {
    // NSLog(@"new value: %f", values[j]);
    result += values[j];
  }
  
  // for each
  return [NSNumber numberWithDouble:result];
}

@end
