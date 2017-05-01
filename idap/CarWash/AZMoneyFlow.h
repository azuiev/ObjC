//
//  AZMoneyFlow.h
//  idap
//
//  Created by Aleksey Zuiev on 01/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

@protocol AZMoneyFlow

- (double)takeMoneyFrom:(id<AZMoneyFlow>  *)human;
- (double)giveMoneyTo:(id<AZMoneyFlow> *)human;

@end
