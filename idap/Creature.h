//
//  Creature.h
//  idap
//
//  Created by Aleksey Zuiev on 20/04/2017.
//  Copyright © 2017 Aleksey Zuiev. All rights reserved.
//

@class Creature;


@interface Creature : NSObject

    typedef enum {
        male = 0,
        female = 1
    } gender;

@property 	(nonatomic, assign)     gender         gender;
@property 	(nonatomic, copy)       NSString       *name;
@property   (nonatomic, assign)     double        age;
@property   (nonatomic, assign)     double        weight;
@property   (nonatomic, retain)     NSMutableArray *children;

+(Creature *)create;
-(void)goToWar;
-(void)bornChild;
-(void)remove;
-(void)sayHi;
-(void)addChild;
-(void)removeChild;

@end
