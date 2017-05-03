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

+ (NSString *)lowercaseStringWithLength:(NSUInteger)length;
+ (NSString *)uppercaseStringWithLength:(NSUInteger)length;
+ (NSString *)numericStringWithLength:(NSUInteger)length;
+ (NSString *)alpanumericStringWithLength:(NSUInteger)length;
+ (NSString *)letterStringWithLength:(NSUInteger)length;

+ (NSString *)lowercaseStringWithLengthFrom:(NSUInteger)minLength toMaxLength:(NSUInteger)maxLength;
+ (NSString *)uppercaseStringWithLengthFrom:(NSUInteger)minLength toMaxLength:(NSUInteger)maxLength;
+ (NSString *)numericStringWithLengthFrom:(NSUInteger)minLength toMaxLength:(NSUInteger)maxLength;
+ (NSString *)alpanumericStringWithLengthFrom:(NSUInteger)minLength toMaxLength:(NSUInteger)maxLength;
+ (NSString *)letterStringWithLengthFrom:(NSUInteger)minLength toMaxLength:(NSUInteger)maxLength;

+ (NSString *)randomName;

@end
