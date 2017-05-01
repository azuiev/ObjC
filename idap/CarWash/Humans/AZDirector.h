//
//  AZDirector.h
//  idap
//
//  Created by Aleksey Zuiev on 26/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZHuman.h"
#import "AZAccountant.h"

@interface AZDirector : AZHuman

@property (nonatomic, assign) double income;

- (void)getIncome:(AZAccountant *)accountant;

@end
