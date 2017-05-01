//
//  NSObject+AZInit.m
//  idap
//
//  Created by Aleksey Zuiev on 01/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "NSObject+AZInit.h"

NSString * const AZDescriptionFormatter = @"%@: %@";

@implementation NSObject (AZInit)

+ (instancetype)init{
    return [[[self alloc] init] autorelease];
}

+ (NSArray *)initWithCount:(NSUInteger)count {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; i += 1) {
        result[i] = [[self alloc] init];
    }
    return (NSArray *)result;
}

@end
