//
//  NSObject+AZInit.m
//  idap
//
//  Created by Aleksey Zuiev on 01/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "NSObject+AZExtension.h"

#import "NSArray+AZExtension.h"

NSString * const AZDescriptionFormatter = @"%@: %@";

NSRange AZMakeRange(NSUInteger min, NSUInteger max) {
    return NSMakeRange(min, max - min + 1);
}

@implementation NSObject (AZExtension)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    return [NSArray objectsWithCount:count block: ^{ return [self object]; }];
}

@end
