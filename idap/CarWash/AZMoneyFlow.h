//
//  AZMoneyFlow.h
//  idap
//
//  Created by Aleksey Zuiev on 01/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

@protocol AZMoneyFlow

@property (nonatomic,readonly) double money;

- (void)takeMoney:(id<AZMoneyFlow>  *)moneySpender;
- (double)giveMoney:(id<AZMoneyFlow> *)monetReceiver;

@end
