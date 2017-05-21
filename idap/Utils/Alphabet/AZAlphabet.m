//
//  AZAlphabet.m
//  idap
//
//  Created by Aleksey Zuiev on 16/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZAlphabet.h"

#import "math.h"

#import "AZRangeAlphabet.h"
#import "AZClusterAlphabet.h"
#import "AZStringsAlphabet.h"

#import "NSString+AZRandomString.h"

@implementation AZAlphabet

#pragma mark -
#pragma mark Class Methods

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[[AZRangeAlphabet alloc] initWithRange:range] autorelease];
}

+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets {
    return [[[AZClusterAlphabet alloc] initWithAlphabets:alphabets] autorelease];
}

+ (instancetype)alphabetWithStrings:(NSArray *)strings {
    return [[[AZStringsAlphabet alloc] initWithStrings:strings] autorelease];
}

+ (instancetype)alphabetWithSymbols:(NSString *)string {
    return [[self alphabetWithStrings:[string symbols]] autorelease];
}

#pragma mark -
#pragma mark Initializations

- (instancetype)initWithRange:(NSRange)range {
    [self release];
    
    return [[[AZRangeAlphabet alloc] initWithRange:range] autorelease];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    [self release];
    
    return [[[AZClusterAlphabet alloc] initWithAlphabets:alphabets] autorelease];
}

- (instancetype)initWithStrings:(NSArray *)strings {
    [self release];
    
    return [[[AZStringsAlphabet alloc] initWithStrings:strings] autorelease];
}

- (instancetype)initWithSymbols:(NSString *)string {
    return [self initWithStrings:[string symbols]];
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    [self doesNotRecognizeSelector:_cmd];
    
    return 0;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    return [self stringAtIndex:index];
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    for (NSString *symbol in self) {
        [string appendString:symbol];
    }
    
    return [[string copy] autorelease];
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained _Nullable [_Nonnull])buffer
                                    count:(NSUInteger)resultLength
{
    state->mutationsPtr = (unsigned long *)self;
    NSUInteger length = MIN(state->state + resultLength, [self count]);
    resultLength = length - state->state;
    if (resultLength) {
        for (NSUInteger index = 0, sourceIndex = state->state; sourceIndex < length; index += 1, sourceIndex += 1) {
            buffer[index] = self[sourceIndex];
        }
    }
    
    state->itemsPtr = buffer;
    state->state += resultLength;
    
    return resultLength;
}

@end
