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

+ (NSString *)lowercaseStringWithLengthInRange:(NSRange)range;
+ (NSString *)uppercaseStringWithLengthInRange:(NSRange)range;
+ (NSString *)numericStringWithLengthInRange:(NSRange)range;
+ (NSString *)alphanumericStringWithLengthInRange:(NSRange)range;
+ (NSString *)letterStringWithLengthInRange:(NSRange)range;

+ (NSString *)randomName;

//+ (NSString *)stringFromAlphabet:(NSString *)alphabet;
//+ (NSString *)stringFromAlphabetWith:(NSString *)alphabet length:(NSUInteger)length;
//+ (NSString *)stringFromAlphabetWithLengthIn:(NSString *)alphabet range:(NSRange)range;

//+ (NSString *)stringFromRange:(NSRange)range;
//+ (NSString *)stringFromRangeWith:(NSRange)range length:(NSUInteger)length;
//+ (NSString *)stringFromRangeWithLengthIn:(NSRange)range range:(NSRange)length;

//+ (NSString *)stringFromArray:(NSarray)array;
//+ (NSString *)stringFromArrayWith:(NSarray)array length:(NSUInteger)length;
//+ (NSString *)stringFromArrayWithLengthIn:(NSarray)array range:(NSRange)length;

@end
