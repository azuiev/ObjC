//
//  CreatureMale.m
//  idap
//
//  Created by Aleksey Zuiev on 21/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "CreatureMale.h"

@implementation CreatureMale

-(void)performGenderSpecificOperation{
    NSLog(@"%@ went to war",[self name]);
}

@end
