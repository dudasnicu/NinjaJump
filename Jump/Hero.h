//
//  Hero.h
//  Jump
//
//  Created by Dudas Nicolae on 8/13/15.
//  Copyright © 2015 Dudas Nicolae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Hero : SKSpriteNode


@property BOOL *isDead;
+(id)heroWithTexture:(SKTexture * )texture;



@end
