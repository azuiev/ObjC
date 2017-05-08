//
//  AZTestRandomString.m
//  idap
//
//  Created by Aleksey Zuiev on 06/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZTestRandomString.h"
#import "NSString+AZRandomString.h"

static const NSString *AZDelimeter = @"**********";

@implementation AZTestRandomString

+ (void)performTest {
    NSLog(@"%@",[NSString stringFromAlphabet:@"abc"]);
    NSLog(@"%@",[NSString stringFromRange:NSMakeRange(105, 107)]);
    NSLog(@"%@",[NSString stringFromArray:[NSArray arrayWithObjects:@"A",@"E",nil]]);
    NSLog(@"%@",AZDelimeter);
    NSLog(@"%@",[NSString stringFromAlphabetWith:@"ixy" length:7]);
    NSLog(@"%@",[NSString stringFromRangeWith:NSMakeRange(120, 127) length:7]);
    NSLog(@"%@",[NSString stringFromArrayWith:[NSArray arrayWithObjects:@"A",@"E",nil] length:7]);
    NSLog(@"%@",AZDelimeter);
    NSLog(@"%@",[NSString stringFromAlphabetWithLengthIn:@"ixy" range:NSMakeRange(1, 5)]);
    NSLog(@"%@",[NSString stringFromRangeWithLengthIn:NSMakeRange(120, 127) range:NSMakeRange(1, 5)]);
    NSLog(@"%@",[NSString stringFromArrayWithLengthIn:[NSArray arrayWithObjects:@"A",@"E",nil] range:NSMakeRange(1, 5)]);
}

@end
