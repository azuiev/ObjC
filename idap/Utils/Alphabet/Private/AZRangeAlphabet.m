//
//  AZRangeAlphabet.m
//  idap
//
//  Created by Aleksey Zuiev on 16/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZRangeAlphabet.h"

@interface AZRangeAlphabet ()
@property (nonatomic, assign) NSRange range;

@end

@implementation AZRangeAlphabet

#pragma mark -
#pragma mark Initializations and deallocations

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    if (self) {
        self.range = range;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return self.range.length;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSRange range = self.range;
    NSAssert(index < range.length, @"error");
    
    return [NSString stringWithFormat:@"%c", (unichar)(range.location + index)];
}

@end
