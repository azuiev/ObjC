//
//  main.m
//  idap
//
//  Created by Aleksey Zuiev on 20/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import "AZTestCreature.h"
#import "AZTestRandomString.h"
#import "AZTestCarWash.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [AZTestCreature performTest];
        //[AZTestRandomString performTest];
        //[AZTestCarWash performTest];
    }
    
    return 0;
}
