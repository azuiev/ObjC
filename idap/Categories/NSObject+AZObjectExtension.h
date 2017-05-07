//
//  NSObject+AZInit.h
//  idap
//
//  Created by Aleksey Zuiev on 01/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AZObjectExtension)

+ (instancetype)object;
+ (NSArray *)arrayWithObjects:(NSUInteger)count;

@end
