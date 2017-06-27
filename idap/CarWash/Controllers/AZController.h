//
//  AZController.h
//  idap
//
//  Created by Aleksey Zuiev on 27/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AZBlock)(void);

@interface AZController : NSObject
@property (nonatomic, assign)   BOOL    running;
@property (atomic, copy)        AZBlock block;

- (instancetype)initWithBlock:(AZBlock)block;

//methods to override. Do not call this methods directly
- (void)start;
- (void)stop;

@end
