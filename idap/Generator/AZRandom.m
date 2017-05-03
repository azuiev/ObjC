//
//  AZStringGenerator.m
//  idap
//
//  Created by Aleksey Zuiev on 27/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZRandom.h"

NSUInteger randomNumberInRange(NSRange range){
    return range.location + arc4random_uniform((uint32_t)(range.length - range.location));
}

NSUInteger randomNumberWithMaxValue(NSUInteger maxValue){
    return randomNumberInRange(NSMakeRange(0, maxValue));
}

@implementation AZRandom

static const NSUInteger AZDefaultStringLength = 8;

#pragma mark -
#pragma mark Public Methods

+ (NSString *)lowercaseString {
    return [self stringWithDefaultLength:[self lowercaseAlphabet]];
}

+ (NSString *)uppercaseString {
    return [self stringWithDefaultLength:[self uppercaseAlphabet]];
}

+ (NSString *)numericString {
    return [self stringWithDefaultLength:[self numericAlphabet]];
}

+ (NSString *)alpanumericString {
    return [self stringWithDefaultLength:[self alphanumericAlphabet]];
}

+ (NSString *)letterString {
    return [self stringWithDefaultLength:[self letterAlphabet]];
}

+ (NSString *)lowercaseStringWithLength:(NSUInteger)length {
    return [self stringWith:[self lowercaseAlphabet] length:length];
}

+ (NSString *)uppercaseStringWithLength:(NSUInteger)length {
    return [self stringWith:[self uppercaseAlphabet] length:length];
}
+ (NSString *)numericStringWithLength:(NSUInteger)length{
    return [self stringWith:[self numericAlphabet] length:length];
}

+ (NSString *)alpanumericStringWithLength:(NSUInteger)length {
    return [self stringWith:[self alphanumericAlphabet] length:length];
}

+ (NSString *)letterStringWithLength:(NSUInteger)length {
    return [self stringWith:[self letterAlphabet] length:length];
}

+ (NSString *)lowercaseStringWithLengthFrom:(NSUInteger)minLength toMaxLength:(NSUInteger)maxLength {
    return [self stringWith:[self lowercaseAlphabet] minLength:(NSUInteger)minLength maxLength:(NSUInteger)maxLength];
}

+ (NSString *)uppercaseStringWithLengthFrom:(NSUInteger)minLength toMaxLength:(NSUInteger)maxLength {
    return [self stringWith:[self uppercaseAlphabet] minLength:(NSUInteger)minLength maxLength:(NSUInteger)maxLength];
}

+ (NSString *)numericStringWithLengthFrom:(NSUInteger)minLength toMaxLength:(NSUInteger)maxLength {
    return [self stringWith:[self numericAlphabet] minLength:(NSUInteger)minLength maxLength:(NSUInteger)maxLength];
}

+ (NSString *)alpanumericStringWithLengthFrom:(NSUInteger)minLength toMaxLength:(NSUInteger)maxLength {
    return [self stringWith:[self alphanumericAlphabet] minLength:(NSUInteger)minLength maxLength:(NSUInteger)maxLength];
}

+ (NSString *)letterStringWithLengthFrom:(NSUInteger)minLength toMaxLength:(NSUInteger)maxLength {
    return [self stringWith:[self uppercaseAlphabet] minLength:(NSUInteger)minLength maxLength:(NSUInteger)maxLength];
}

#pragma mark -
#pragma mark User Methods

+ (NSString *)randomName {
    NSMutableString *result = [self stringFromAlphabet:[self lowercaseAlphabet] withLength:2 + arc4random_uniform((uint32)AZDefaultStringLength)];
    return [result capitalizedString];

}

#pragma mark -
#pragma mark Privat Methods

+ (NSString *)stringWithDefaultLength:(NSString *)alphabet {
    return [self stringFromAlphabet:alphabet withLength:AZDefaultStringLength];
}

+ (NSString *)stringWith:(NSString *)alphabet length:(NSUInteger)length {
    return [self stringFromAlphabet:alphabet withLength:length];
}

+ (NSString *)stringWith:(NSString *)alphabet minLength:(NSUInteger)minLength maxLength:(NSUInteger)maxLength {
    return [self stringFromAlphabet:alphabet withLength:randomNumberInRange(NSMakeRange(minLength, maxLength))];
}

+ (NSMutableString *)stringFromAlphabet:(NSString *)alphabet withLength:(NSUInteger)length {
    NSMutableString *result = [NSMutableString string];
    for (u_int i = 0; i < length; i += 1) {
        [result appendFormat:@"%c",[alphabet characterAtIndex:arc4random_uniform((uint32_t)[alphabet length])]];
    }
    return result;
}

+ (NSMutableString *)characterStringFromRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    for (char character = range.location; character <= range.length; character += 1) {
        [result appendFormat:@"%c",character];
    }
    return result;
}

+ (NSString *)lowercaseAlphabet {
    return [self characterStringFromRange:NSMakeRange('a', 'z')];
}

+ (NSString *)uppercaseAlphabet {
    return [self characterStringFromRange:NSMakeRange('A', 'Z')];
}

+ (NSString *)numericAlphabet {
    return [self characterStringFromRange:NSMakeRange('0', '9')];
}

+ (NSString *)letterAlphabet {
    NSMutableString *result = (NSMutableString *)[self lowercaseAlphabet];
    [result appendString:[self uppercaseAlphabet]];
    
    return result;
}

+ (NSString *)alphanumericAlphabet {
    NSMutableString *result = (NSMutableString *)[self letterAlphabet];
    [result appendString:[self numericAlphabet]];
    
    return result;
}

@end
