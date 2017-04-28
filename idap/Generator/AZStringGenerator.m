//
//  AZStringGenerator.m
//  idap
//
//  Created by Aleksey Zuiev on 27/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZStringGenerator.h"

@implementation AZStringGenerator

static const u_int AZDefaultStringLength = 8;

+ (NSString *)stringFromAlphabet:(NSString *)alphabet withLength:(u_int)length {
    NSMutableString *result = [NSMutableString string];
    for (u_int i = 0; i < length; i += 1) {
        [result appendFormat:@"%c",[alphabet characterAtIndex:arc4random_uniform((uint32_t)[alphabet length])]];
    }
    return result;
}

+ (NSString *)characterStringFromRange:(NSRange)range {
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

+ (NSString *)lowercaseString {
    return [self stringFromAlphabet:[self lowercaseAlphabet] withLength:AZDefaultStringLength];
}

+ (NSString *)uppercaseString {
    return [self stringFromAlphabet:[self uppercaseAlphabet] withLength:AZDefaultStringLength];
}

+ (NSString *)numericString {
    return [self stringFromAlphabet:[self numericAlphabet] withLength:AZDefaultStringLength];
}


//+ (NSString *)lowercaseStringWithLength:(short)length;
//+ (NSString *)uppercaseStringWithLength:(short)length;
//+ (NSUInteger *)numericStringWithLength:(short)length;
//
//+ (NSString *)lowercaseStringWithLengthFromLength:(short)minLength toMaxLength:(short)maxLength;
//+ (NSString *)uppercaseStringWithLengthFromLength:(short)minLength toMaxLength:(short)maxLength;
//+ (NSUInteger *)numericStringWithLengthFromLength:(short)minLength toMaxLength:(short)maxLength;

@end
