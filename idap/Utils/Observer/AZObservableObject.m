//
//  AZObservableObject.m
//  idap
//
//  Created by Aleksey Zuiev on 24/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZObservableObject.h"

@interface AZObservableObject ()
@property (nonatomic, retain) NSMutableSet  *mutableObservers;

@end

@implementation AZObservableObject

@dynamic observers;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc
{
    self.mutableObservers = nil;
    
    [super dealloc];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mutableObservers = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (instancetype)observers {
    return [[self.mutableObservers copy] autorelease];
}

- (void)setState:(NSUInteger)state {
    if (state != _state) {
        _state = state;
        
        [self notifyOfStateWithSelector:[self selectorForState:(NSUInteger)state]];
    }
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    if(!observer) {
        NSLog(@"%@", NSInvalidArgumentException);
    }
    
    [self.mutableObservers addObject:observer];
}

- (void)removeObserver:(id)observer {
    [self.mutableObservers removeObject:observer];
}

- (BOOL)isObservedByObject:(id)object {
    return [self.mutableObservers containsObject:object];
}

#pragma mark -
#pragma mark Private

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    
    return NULL;
}

- (void)notifyOfStateWithSelector:(SEL)selector {
    NSMutableSet *observers = self.mutableObservers;
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self];
        }
    }
}

@end
