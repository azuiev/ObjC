//
//  NSString+AZRandomString.h
//  idap
//
//  Created by Aleksey Zuiev on 09/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AZRandomString)

+ (instancetype)lowercaseString;
+ (instancetype)uppercaseString;
+ (instancetype)numericString;
+ (instancetype)alphanumericString;
+ (instancetype)letterString;

+ (instancetype)lowercaseStringWithLength:(NSUInteger)length;
+ (instancetype)uppercaseStringWithLength:(NSUInteger)length;
+ (instancetype)numericStringWithLength:(NSUInteger)length;
+ (instancetype)alphanumericStringWithLength:(NSUInteger)length;
+ (instancetype)letterStringWithLength:(NSUInteger)length;

+ (instancetype)lowercaseStringWithLengthInRange:(NSRange)range;
+ (instancetype)uppercaseStringWithLengthInRange:(NSRange)range;
+ (instancetype)numericStringWithLengthInRange:(NSRange)range;
+ (instancetype)alphanumericStringWithLengthInRange:(NSRange)range;
+ (instancetype)letterStringWithLengthInRange:(NSRange)range;

+ (instancetype)stringFromAlphabet:(NSString *)alphabet;
+ (instancetype)stringFromAlphabetWith:(NSString *)alphabet length:(NSUInteger)length;
+ (instancetype)stringFromAlphabetWithLengthIn:(NSString *)alphabet range:(NSRange)range;

+ (instancetype)stringFromRange:(NSRange)range;
+ (instancetype)stringFromRangeWith:(NSRange)range length:(NSUInteger)length;
+ (instancetype)stringFromRangeWithLengthIn:(NSRange)range range:(NSRange)length;

+ (instancetype)stringFromArray:(NSArray *)array;
+ (instancetype)stringFromArrayWith:(NSArray *)array length:(NSUInteger)length;
+ (instancetype)stringFromArrayWithLengthIn:(NSArray *)array range:(NSRange)length;

@end
