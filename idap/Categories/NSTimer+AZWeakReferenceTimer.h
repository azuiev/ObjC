//
//  NSTimer+AZWeakReferenceTimer.h
//  idap
//
//  Created by Aleksey Zuiev on 18/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSDate.h>

@interface NSTimer (AZWeakReferenceTimer)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                     weakReferenceTarget:(id)aTarget
                                   selector:(SEL)aSelector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)yesOrNo;

@end
