//
//  NSObject+AZInit.h
//  idap
//
//  Created by Aleksey Zuiev on 01/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AZInit)
+ (instancetype)init;
+ (NSArray *)initWithCount:(NSUInteger)count;

@end
