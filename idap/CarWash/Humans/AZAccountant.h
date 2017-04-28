//
//  AZAccountant.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZHuman.h"

@interface AZAccountant : AZHuman

@property (nonatomic,assign) double moneyFromWashers;


- (void)calculateMoney;
- (void)takeMoneyFromWasher:(double) amount;
- (double)passIncomeToDirector;

@end
