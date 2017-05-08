//
//  NSObject+AZRandomNumber.h
//  idap
//
//  Created by Aleksey Zuiev on 09/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (AZRandomNumber)

NSUInteger randomNumberInRange(NSRange range);
NSUInteger randomNumberWithMaxValue(NSUInteger maxValue);

@end
