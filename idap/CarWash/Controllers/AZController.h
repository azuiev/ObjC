//
//  AZWashController.h
//  idap
//
//  Created by Aleksey Zuiev on 01/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AZBlock)(void);

@interface AZController : NSObject
@property (nonatomic, readonly) AZBlock block;
@property (nonatomic, readonly) BOOL    running;

- (instancetype)initWithBlock:(void(^)())block;

- (void)start;
- (void)stop;

@end
