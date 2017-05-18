//
//  AZClusterAlphabet.m
//  idap
//
//  Created by Aleksey Zuiev on 16/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZClusterAlphabet.h"

@interface AZClusterAlphabet ()
@property (nonatomic, retain) NSArray       *alphabets;
@property (nonatomic, assign) NSUInteger    count;

- (NSUInteger)countWithAlphabets:(NSArray *)alphabets;

@end

@implementation AZClusterAlphabet

#pragma mark -
#pragma mark Initializations and deallocations

-(void)dealloc {
    self.alphabets = nil;
    
    [super dealloc];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    self = [super init];
    if (self) {
        self.alphabets = alphabets;
        self.count = [self countWithAlphabets:alphabets];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSUInteger count = self.count;
    NSArray *alphabets = self.alphabets;
    NSAssert(index < count, NSRangeException);
    NSUInteger iterator = 0;
    NSUInteger length = 0;
    for (AZAlphabet *alphabet in alphabets) {
        length = [alphabet count];
        if (index < length) {
            return alphabet[index];
        }
        
        index -= length;
    }
    
    return 0;
}

#pragma mark -
#pragma mark Private

- (NSUInteger)countWithAlphabets:(NSArray *)alphabets {
    NSUInteger result = 0;
    for (AZAlphabet *alphabet in alphabets) {
        result += [alphabet count];
    }
    
    return result;
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained _Nullable [_Nonnull])buffer
                                    count:(NSUInteger)resultLength
{
    return [super countByEnumeratingWithState:state objects:buffer count:resultLength];
}

@end
