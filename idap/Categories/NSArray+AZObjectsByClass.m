//
//  NSArray+AZArrayByClass.m
//  idap
//
//  Created by Aleksey Zuiev on 08/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "NSArray+AZObjectsByClass.h"

@implementation NSArray (AZObjectsByClass)

- (instancetype)arrayWithObjectsByClass:(Class)cls {
    NSMutableArray *result = [NSMutableArray array];
    for (NSObject *object in self) {
        if ([object isKindOfClass:cls]){
            [result addObject:object];
        }
    }
    
    return [NSArray arrayWithArray:result];
}
@end
