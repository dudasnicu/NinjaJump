//
	//  Hero.m
//  Jump
//
//  Created by Dudas Nicolae on 8/13/15.
//  Copyright © 2015 Dudas Nicolae. All rights reserved.
//

#import "Hero.h"


@implementation Hero


+(id)heroWithTexture:(SKTexture *) texture {
    
    SKSpriteNode * myHero = [[SKSpriteNode alloc] initWithTexture:texture];
    myHero.name = @"myHero";
//    Hero *myHero = [Hero spriteNodeWithColor:[SKColor blackColor] size:CGSizeMake(25, 50)];
//    [myHero setAnchorPoint:CGPointMake(0, 0)];
//    myHero.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:myHero.frame.size];
//    myHero.physicsBody.affectedByGravity = NO;
//    myHero.physicsBody.dynamic = YES;
//    myHero.physicsBody.collisionBitMask = 0;
//    myHero.name = @"myHero";
    return myHero;
    
}

@end
