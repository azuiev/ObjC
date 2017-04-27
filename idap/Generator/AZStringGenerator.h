//
//  AZStringGenerator.h
//  idap
//
//  Created by Aleksey Zuiev on 27/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZStringGenerator : NSObject

+ (NSArray *)lowercaseAlphabet;
+ (NSArray *)uppercaseAlphabet;
+ (NSArray *)numericAlphabet;

+ (NSString *)lowercaseString;
+ (NSString *)uppercaseString;
+ (NSUInteger *)numericString;

+ (NSString *)lowercaseStringWithLength:(short)length;
+ (NSString *)uppercaseStringWithLength:(short)length;
+ (NSUInteger *)numericStringWithLength:(short)length;

+ (NSString *)lowercaseStringWithLengthFromLength:(short)minLength toMaxLength:(short)maxLength;
+ (NSString *)uppercaseStringWithLengthFromLength:(short)minLength toMaxLength:(short)maxLength;
+ (NSUInteger *)numericStringWithLengthFromLength:(short)minLength toMaxLength:(short)maxLength;

@end
