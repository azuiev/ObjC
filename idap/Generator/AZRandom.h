//
//  AZStringGenerator.h
//  idap
//
//  Created by Aleksey Zuiev on 27/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

NSUInteger randomNumberInRange(NSRange range);
NSUInteger randomNumberWithMaxValue(NSUInteger maxValue);

@interface AZRandom : NSString

+ (NSString *)lowercaseString;
+ (NSString *)uppercaseString;
+ (NSString *)numericString;
+ (NSString *)alpanumericString;
+ (NSString *)letterString;

//+ (NSString *)lowercaseStringWithLength:(short)length;
//+ (NSString *)uppercaseStringWithLength:(short)length;
//+ (NSString *)numericStringWithLength:(short)length;
//
//+ (NSString *)lowercaseStringWithLengthFromLength:(short)minLength toMaxLength:(short)maxLength;
//+ (NSString *)uppercaseStringWithLengthFromLength:(short)minLength toMaxLength:(short)maxLength;
//+ (NSString *)numericStringWithLengthFromLength:(short)minLength toMaxLength:(short)maxLength;

+ (NSString *)randomName;

@end
