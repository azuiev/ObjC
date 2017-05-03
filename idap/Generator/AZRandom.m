//
//  AZStringGenerator.m
//  idap
//
//  Created by Aleksey Zuiev on 27/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZRandom.h"

static const NSUInteger AZDefaultStringLength = 8;

#pragma mark -
#pragma mark C Methods

NSUInteger randomNumberInRange(NSRange range) {
    return range.location + arc4random_uniform((uint32_t)(range.length - range.location + 1));
}

NSUInteger randomNumberWithMaxValue(NSUInteger maxValue) {
    return randomNumberInRange(NSMakeRange(0, maxValue));
}

@implementation AZRandom

#define alphabetMethods(alphabet)  \
    + (NSString *) alphabet ##String { \
        return [self stringFromAlphabetWithDefaultLength:[self alphabet ##Alphabet]]; \
    } \
    + (NSString *)alphabet ##StringWithLength:(NSUInteger)length { \
        return [self stringFromAlphabetWith:[self alphabet ##Alphabet] length:length];\
    }\
    + (NSString *)alphabet ##StringWithLengthInRange:(NSRange)range { \
        return [self stringFromAlphabetWithLengthIn:[self alphabet ##Alphabet] range:(NSRange)range]; \
    } \


#pragma mark -
#pragma mark Public Methods

alphabetMethods(lowercase);
alphabetMethods(uppercase);
alphabetMethods(numeric);
alphabetMethods(letter);
alphabetMethods(alphanumeric);


#undef alphabetMethods

#pragma mark -
#pragma mark User Methods

+ (NSString *)randomName {
    NSMutableString *result = [self stringFromAlphabetWith:[self lowercaseAlphabet] length:2 + arc4random_uniform((uint32)AZDefaultStringLength)];
    
    return [result capitalizedString];
}

#pragma mark -
#pragma mark Alphabet Methods

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

#pragma mark -
#pragma mark Privat Methods

+ (NSString *)stringFromAlphabetWithDefaultLength:(NSString *)alphabet {
    return [self stringFromAlphabetWith:alphabet length:AZDefaultStringLength];
}

+ (NSString *)stringFromAlphabetWithLengthIn:(NSString *)alphabet range:(NSRange)range {
    return [self stringFromAlphabetWith:alphabet length:randomNumberInRange(range)];
}

+ (NSMutableString *)stringFromAlphabetWith:(NSString *)alphabet length:(NSUInteger)length {
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

@end
