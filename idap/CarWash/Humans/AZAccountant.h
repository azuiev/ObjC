//
//  AZAccountant.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZHuman.h"
#import "AZWasher.h"

@interface AZAccountant : AZHuman

- (void)calculateMoney:(AZWasher *)washer;

@end
