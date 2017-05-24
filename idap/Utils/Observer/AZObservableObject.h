//
//  AZObservableObject.h
//  idap
//
//  Created by Aleksey Zuiev on 24/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, readonly) NSSet       *observers;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)isObservedByObject:(id)object;

//this method is intended for subclassing. Never call it directly
- (SEL)selectorForState:(NSUInteger)state;

@end
