//
//  AZGCDController.h
//  idap
//
//  Created by Aleksey Zuiev on 23/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZGCDController : NSObject

typedef void (^AZBlock)(void);

@property (nonatomic, readonly) AZBlock block;
@property (nonatomic, readonly) BOOL    running;

- (instancetype)initWithBlock:(void(^)())block;

- (void)start;
- (void)stop;

@end
