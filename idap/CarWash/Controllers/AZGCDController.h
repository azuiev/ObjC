//
//  AZGCDController.h
//  idap
//
//  Created by Aleksey Zuiev on 23/06/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AZBlock)(void);

@interface AZGCDController : NSObject
@property (nonatomic, assign)   BOOL    running;
@property (atomic, copy)        AZBlock block;

- (instancetype)initWithBlock:(AZBlock)block;

@end
