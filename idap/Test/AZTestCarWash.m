//
//  AZTestCarWash.m
//  idap
//
//  Created by Aleksey Zuiev on 27/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZTestCarWash.h"

#import "AZAccountant.h"
#import "AZDirector.h"
#import "AZWasher.h"

@implementation AZTestCarWash

+ (void)performTtest{
    AZWasher *washer = [AZWasher init];
    [washer sayHi];
}

@end
