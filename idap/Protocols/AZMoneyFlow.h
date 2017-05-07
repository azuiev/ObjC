//
//  AZMoneyFlow.h
//  idap
//
//  Created by Aleksey Zuiev on 01/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

@protocol AZMoneyFlow

@property (nonatomic,readonly) double money;

- (double)giveMoney:(id<AZMoneyFlow>)moneyReceiver;

@optional
- (void)takeMoney:(id<AZMoneyFlow>)moneySpender;

@end
