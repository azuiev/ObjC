//
//  AZTestRandomString.m
//  idap
//
//  Created by Aleksey Zuiev on 06/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZTestRandomString.h"
#import "AZRandomString.h"

static const NSString *AZDelimeter = @"**********";

@implementation AZTestRandomString

+ (void)performTest {
    NSLog(@"%@",[AZRandomString stringFromAlphabet:@"abc"]);
    NSLog(@"%@",[AZRandomString stringFromRange:NSMakeRange(105, 107)]);
    NSLog(@"%@",[AZRandomString stringFromArray:[NSArray arrayWithObjects:@"A",@"E",nil]]);
    NSLog(@"%@",AZDelimeter);
    NSLog(@"%@",[AZRandomString stringFromAlphabetWith:@"ixy" length:7]);
    NSLog(@"%@",[AZRandomString stringFromRangeWith:NSMakeRange(120, 127) length:7]);
    NSLog(@"%@",[AZRandomString stringFromArrayWith:[NSArray arrayWithObjects:@"A",@"E",nil] length:7]);
    NSLog(@"%@",AZDelimeter);
    NSLog(@"%@",[AZRandomString stringFromAlphabetWithLengthIn:@"ixy" range:NSMakeRange(1, 5)]);
    NSLog(@"%@",[AZRandomString stringFromRangeWithLengthIn:NSMakeRange(120, 127) range:NSMakeRange(1, 5)]);
    NSLog(@"%@",[AZRandomString stringFromArrayWithLengthIn:[NSArray arrayWithObjects:@"A",@"E",nil] range:NSMakeRange(1, 5)]);
}

@end
