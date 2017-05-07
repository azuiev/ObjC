//
//  NSArray+AZArrayByClass.h
//  idap
//
//  Created by Aleksey Zuiev on 08/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (AZObjectsByClass)

- (instancetype)arrayWithObjectsByClass:(Class)cls;

@end
