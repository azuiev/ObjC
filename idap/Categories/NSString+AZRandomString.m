//
//  NSString+AZRandomString.m
//  idap
//
//  Created by Aleksey Zuiev on 09/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "NSString+AZRandomString.h"
#import "NSNumber+AZRandomNumber.h"

static const NSUInteger AZDefaultStringLength = 8;

@implementation NSString (AZRandomString)

#pragma mark -
#pragma mark Public Methods

//string from alphabet
+ (instancetype)stringFromAlphabet:(NSString *)alphabet {
    return [self stringFromAlphabetWith:alphabet length:AZDefaultStringLength];
}

+ (instancetype)stringFromAlphabetWith:(NSString *)alphabet length:(NSUInteger)length {
    NSMutableString *result = [NSMutableString string];
    for (u_int i = 0; i < length; i += 1) {
        [result appendFormat:@"%c",[alphabet characterAtIndex:arc4random_uniform((uint32_t)[alphabet length])]];
    }
    
    return result;
}

+ (instancetype)stringFromAlphabetWithLengthIn:(NSString *)alphabet range:(NSRange)range {
    return [self stringFromAlphabetWith:alphabet length:randomNumberInRange(range)];
}

//string from range
+ (instancetype)stringFromRange:(NSRange)range {
    return [self stringFromAlphabetWith:[self alphabetFromRange:range] length:AZDefaultStringLength];
}

+ (instancetype)stringFromRangeWith:(NSRange)range length:(NSUInteger)length {
    return [self stringFromAlphabetWith:[self alphabetFromRange:range] length:length];
}

+ (instancetype)stringFromRangeWithLengthIn:(NSRange)range range:(NSRange)length{
    return [self stringFromAlphabetWith:[self alphabetFromRange:range] length:randomNumberInRange(length)];
}

//string from array
+ (instancetype)stringFromArray:(NSArray *)array {
    return [self stringFromAlphabetWith:[self alphabetFromArray:array] length:AZDefaultStringLength];
}

+ (instancetype)stringFromArrayWith:(NSArray *)array length:(NSUInteger)length {
    return [self stringFromAlphabetWith:[self alphabetFromArray:array] length:length];
}

+ (instancetype)stringFromArrayWithLengthIn:(NSArray *)array range:(NSRange)length {
    return [self stringFromAlphabetWith:[self alphabetFromArray:array] length:randomNumberInRange(length)];
}

#define alphabetMethods(alphabet)  \
+ (instancetype) alphabet ##String { \
return [self stringFromAlphabet:[self alphabet ##Alphabet]]; \
} \
+ (instancetype)alphabet ##StringWithLength:(NSUInteger)length { \
return [self stringFromAlphabetWith:[self alphabet ##Alphabet] length:length];\
}\
+ (instancetype)alphabet ##StringWithLengthInRange:(NSRange)range { \
return [self stringFromAlphabetWithLengthIn:[self alphabet ##Alphabet] range:(NSRange)range]; \
} \

alphabetMethods(lowercase);
alphabetMethods(uppercase);
alphabetMethods(numeric);
alphabetMethods(letter);
alphabetMethods(alphanumeric);

#undef alphabetMethods

#pragma mark -
#pragma mark User Methods

+ (NSString *)randomName {
    NSMutableString *result = (NSMutableString *)[self stringFromAlphabetWith:[self lowercaseAlphabet] length:2 + arc4random_uniform((uint32)AZDefaultStringLength)];
    
    return [result capitalizedString];
}

#pragma mark -
#pragma mark Alphabet Methods

+ (instancetype)lowercaseAlphabet {
    return [self alphabetFromRange:NSMakeRange('a', 'z')];
}

+ (instancetype)uppercaseAlphabet {
    return [self alphabetFromRange:NSMakeRange('A', 'Z')];
}

+ (instancetype)numericAlphabet {
    return [self alphabetFromRange:NSMakeRange('0', '9')];
}

+ (instancetype)letterAlphabet {
    NSMutableString *result = (NSMutableString *)[self lowercaseAlphabet];
    [result appendString:[self uppercaseAlphabet]];
    
    return result;
}

+ (instancetype)alphanumericAlphabet {
    NSMutableString *result = (NSMutableString *)[self letterAlphabet];
    [result appendString:[self numericAlphabet]];
    
    return result;
}

#pragma mark -
#pragma mark Privat Methods

+ (NSMutableString *)alphabetFromRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    for (char character = range.location; character <= range.length; character += 1) {
        [result appendFormat:@"%c",character];
    }
    
    return result;
}

+ (instancetype)alphabetFromArray:(NSArray *)array {
    NSMutableString *result = [NSMutableString string];
    for (NSString *character in array) {
        [result appendFormat:@"%@",character];
    }
    
    return result;
}

@end
