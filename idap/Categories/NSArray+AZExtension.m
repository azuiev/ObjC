//
//  NSArray+AZArrayByClass.m
//  idap
//
//  Created by Aleksey Zuiev on 08/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "NSArray+AZExtension.h"

@implementation NSArray (AZExtension)

+ (NSArray *)objectsWithCount:(NSUInteger)count block:(id(^)())block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; i += 1) {
        result[i] = block();
    }
    
    return [NSArray arrayWithArray:result];
}

- (instancetype)objectsWithClass:(Class)cls {
    NSMutableArray *result = [NSMutableArray array];
    for (NSObject *object in self) {
        if ([object isKindOfClass:cls]){
            [result addObject:object];
        }
    }
    
    return [NSArray arrayWithArray:result];
}




@end
