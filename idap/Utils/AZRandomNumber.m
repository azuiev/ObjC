//
//  AZRandomNumber.m
//  idap
//
//  Created by Aleksey Zuiev on 15/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AZRandomNumber.h"

#import "NSObject+AZExtension.h"

NSUInteger randomNumberInRange(NSRange range) {
    return range.location + arc4random_uniform((uint32_t)(range.length - range.location));
}

NSUInteger randomNumberWithMaxValue(NSUInteger maxValue) {
    return randomNumberInRange(AZMakeRange(0, maxValue));
}
