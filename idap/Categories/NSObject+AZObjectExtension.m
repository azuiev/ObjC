//
//  NSObject+AZInit.m
//  idap
//
//  Created by Aleksey Zuiev on 01/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "NSObject+AZObjectExtension.h"

NSString * const AZDescriptionFormatter = @"%@: %@";

NSRange AZMakeRange(NSUInteger min, NSUInteger max) {
    return NSMakeRange(min, max - min + 1);
}

@implementation NSObject (AZObjectExtension)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    return [self objectsWithCount:count block:^(){ return [self object]; }];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count block:(id(^)())block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; i += 1) {
        result[i] = block();
    }
    
    return [NSArray arrayWithArray:result];
}

@end
