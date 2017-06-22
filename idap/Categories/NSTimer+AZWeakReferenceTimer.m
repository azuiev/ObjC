//
//  NSTimer+AZWeakReferenceTimer.m
//  idap
//
//  Created by Aleksey Zuiev on 18/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "NSTimer+AZWeakReferenceTimer.h"

#import "AZAssignRererenceWithSelector.h"

@implementation NSTimer (AZWeakReferenceTimer)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)AZTimerInterwal
                        weakReferenceTarget:(id)target
                                   selector:(SEL)selector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)yesOrNo
{
    return [NSTimer scheduledTimerWithTimeInterval:AZTimerInterwal
                                             target:[AZAssignRererenceWithSelector referenceWithTarger:target selector:selector]
                                           selector:selector
                                           userInfo:userInfo
                                            repeats:yesOrNo];
}
@end
