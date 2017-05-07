//
//  NSObject+AZInit.m
//  idap
//
//  Created by Aleksey Zuiev on 01/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "NSObject+AZObjectExtension.h"

NSString * const AZDescriptionFormatter = @"%@: %@";

@implementation NSObject (AZObjectExtension)
+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

+ (NSArray *)arrayWithObjects:(NSUInteger)count {
    return [self arrayWithObjects:count block:^(){ return [self object]; } ];
}

+ (NSArray *)arrayWithObjects:(NSUInteger)count block:(id(^)())block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; i += 1) {
        result[i] = block();
    }
    
    return [NSArray arrayWithArray:result];
}

@end
