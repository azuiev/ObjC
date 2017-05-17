//
//  AZRangeAlphabet.h
//  idap
//
//  Created by Aleksey Zuiev on 16/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "AZAlphabet.h"

@interface AZRangeAlphabet : AZAlphabet
@property (nonatomic, readonly) NSRange range;

- (instancetype)initWithRange:(NSRange)range;

@end
