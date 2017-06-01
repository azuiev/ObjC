//
//  AZMoneyFlow.h
//  idap
//
//  Created by Aleksey Zuiev on 01/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

@protocol AZMoneyFlow
@property (nonatomic, readonly) NSUInteger money;

- (NSUInteger)giveMoney;

@optional
- (void)takeMoneyFromObject:(id)object;

@end
