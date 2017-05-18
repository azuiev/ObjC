//
//  AZStringsAlphabet.h
//  idap
//
//  Created by Aleksey Zuiev on 16/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZAlphabet.h"

@interface AZStringsAlphabet : AZAlphabet
@property (nonatomic, readonly) NSArray   *strings;

- (instancetype)initWithStrings:(NSArray *)strings;

@end
