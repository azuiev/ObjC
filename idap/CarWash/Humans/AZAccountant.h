//
//  AZAccountant.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZHuman.h"

@interface AZAccountant : AZHuman

@property (nonatomic,assign) float moneyFromWashers;


- (void)calculateMoney:(double)amount;
- (void)takeMoneyFromWasher:(float) amount;

@end
