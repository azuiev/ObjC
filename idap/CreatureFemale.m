//
//  CreatureFemale.m
//  idap
//
//  Created by Aleksey Zuiev on 21/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "CreatureFemale.h"

@implementation CreatureFemale

-(void)performGenderSpecificOperation{
    NSLog(@"%@ went to give birth to children",[self name]);
}

@end
