//
//  AZAssignRererenceWithSelector.m
//  idap
//
//  Created by Aleksey Zuiev on 18/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZAssignRererenceWithSelector.h"

@interface AZAssignRererenceWithSelector ()
@property (nonatomic, assign) SEL   selector;
@property (nonatomic, assign) id    target;

@end

@implementation AZAssignRererenceWithSelector

@synthesize target = _target;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)referenceWithTarger:(id)target selector:(SEL)selector {
    return [[[self alloc] initWithTarget:target selector:(SEL)selector] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [super dealloc];
}

- (instancetype)initWithTarget:(id)target selector:(SEL)selector {
    self = [super init];
    if (self) {
        self.target = target;
        self.selector = selector;
    }
    
    return self;
}

#pragma mark -
#pragma mark Forwarding

- (id)forwardingTargetForSelector:(SEL)aSelector {
    SEL selector = self.selector;
    id target = self.target;
    
    if (selector == aSelector) {
        if ([target respondsToSelector:selector]) {
            return [[target retain] autorelease];
        }
    }
    
    return nil;
}

@end
