//
//  AZAccountant.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZEmployee.h"

#import "AZWasher.h"

@interface AZAccountant : AZEmployee

- (void)calculateMoney:(AZWasher *)washer;

@end
