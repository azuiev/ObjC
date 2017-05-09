//
//  NSObject+AZInit.h
//  idap
//
//  Created by Aleksey Zuiev on 01/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

NSRange AZMakeRange(NSUInteger min, NSUInteger max);

@interface NSObject (AZObjectExtension)

+ (instancetype)object;
+ (NSArray *)objectsWithCount:(NSUInteger)count;

@end
