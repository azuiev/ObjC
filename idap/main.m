//
//  main.m
//  idap
//
//  Created by Aleksey Zuiev on 20/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Creature.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Creature *creature1 = [Creature create];
        [creature1 setName:@"Yasya"];
        [creature1 setGender:male];
        [creature1 setAge:25.4];
        [creature1 setWeight:99.9];
        [creature1 sayHi];
        
    }
    return 0;
}
