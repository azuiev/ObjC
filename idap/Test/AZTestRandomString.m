//
//  AZTestRandomString.m
//  idap
//
//  Created by Aleksey Zuiev on 06/05/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZTestRandomString.h"
#import "AZAlphabet.h"

#import "NSString+AZRandomString.h"
#import "NSObject+AZExtension.h"

static const NSString *AZDelimeter = @"**********";

@implementation AZTestRandomString

+ (void)performTest {
    NSLog(@"%@",[NSString stringFromAlphabet:@"abc"]);
    NSLog(@"%@",[NSString stringFromRange:NSMakeRange(105, 3)]);
    NSLog(@"%@",[NSString stringFromArray:[NSArray arrayWithObjects:@"A",@"E",nil]]);
    NSLog(@"%@",AZDelimeter);
    NSLog(@"%@",[NSString stringFromAlphabet:@"ixy" length:7]);
    NSLog(@"%@",[NSString stringFromRange:NSMakeRange(120, 3) length:7]);
    NSLog(@"%@",[NSString stringFromArray:[NSArray arrayWithObjects:@"A",@"E",nil] length:7]);
    NSLog(@"%@",AZDelimeter);
    NSLog(@"%@",[NSString stringFromAlphabet:@"ixy" lengthInRange:NSMakeRange(1, 5)]);
    NSLog(@"%@",[NSString stringFromRange:NSMakeRange(120, 3) lengthInRange:NSMakeRange(1, 5)]);
    NSLog(@"%@",[NSString stringFromArray:[NSArray arrayWithObjects:@"A",@"E",nil] lengthInRange:NSMakeRange(1, 5)]);
    
    NSRange range = AZMakeRange('A', 'z');
    AZAlphabet *alphabet = [AZAlphabet alphabetWithRange:range];
    NSMutableString *string = [NSMutableString stringWithCapacity:[alphabet count]];
    for (NSString *character in alphabet) {
        [string appendString:character];
    }
    
    NSLog(@"%@ - %lu", string , string.length);
    
}

@end
