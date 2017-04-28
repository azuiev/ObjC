//
//  AZStringGenerator.h
//  idap
//
//  Created by Aleksey Zuiev on 27/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZStringGenerator : NSObject

+ (NSString *)lowercaseString;
+ (NSString *)uppercaseString;
+ (NSString *)numericString;
//+ (NSString *)alpanumericString;

//+ (NSString *)lowercaseStringWithLength:(short)length;
//+ (NSString *)uppercaseStringWithLength:(short)length;
//+ (NSString *)numericStringWithLength:(short)length;
//
//+ (NSString *)lowercaseStringWithLengthFromLength:(short)minLength toMaxLength:(short)maxLength;
//+ (NSString *)uppercaseStringWithLengthFromLength:(short)minLength toMaxLength:(short)maxLength;
//+ (NSString *)numericStringWithLengthFromLength:(short)minLength toMaxLength:(short)maxLength;

+ (NSString *)randomName;

+ (uint32_t)randomNumberInRangeFrom:(uint32_t)minValue to:(uint32_t)maxValue;
+ (uint32_t)randomNumberWithMaxValue:(uint32_t)maxValue;

@end
