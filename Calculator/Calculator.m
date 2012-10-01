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

- (NSNumber *) calculate:(NSArray *)tokens
{
  for (NSString *tok in tokens) {
    NSLog(@"got token: %@", tok);
  }
  
  // for each
  return [NSNumber numberWithDouble:0.0];
}

@end
