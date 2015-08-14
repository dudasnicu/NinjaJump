//
//  GameScene.h
//  Jump
//

//  Copyright (c) 2015 Dudas Nicolae. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Hero.h"

@interface GameScene : SKScene <SKPhysicsContactDelegate>

@property SKSpriteNode *leftWall;
@property SKSpriteNode *lconWall;
@property SKSpriteNode *rconWall;
@property SKSpriteNode *rightWall;
@property SKNode *background;
@property SKNode *foreground;
@property SKNode *midground;
@property BOOL *isLeft;
@property BOOL *isRight;
@property Hero *myHero;
@property SKTextureAtlas *atlas;
@property SKTexture *textureBan;
@property SKTexture *textureNinja;
@property SKTexture *texturePlatforma;
@property SKTexture *textureWall;


@end