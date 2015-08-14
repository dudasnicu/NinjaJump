//
//  GameScene.m
//  Jump
//
//  Created by Dudas Nicolae on 8/10/15.
//  Copyright (c) 2015 Dudas Nicolae. All rights reserved.
//

#import "GameScene.h"
#import "Hero.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    self.physicsWorld.contactDelegate = self; 
    
    self.size = view.bounds.size;
    
    self.atlas = [SKTextureAtlas atlasNamed:@"resources.atlas"];
    self.textureBan = [_atlas textureNamed:@"ban"];
    self.textureNinja = [_atlas textureNamed:@"ninja"];
    self.textureWall = [_atlas textureNamed:@"perete"];
    self.texturePlatforma = [_atlas textureNamed:@"platforma"];
    
    
    _myHero = [Hero heroWithTexture:_textureNinja];
    [_myHero setPosition:CGPointMake(3 * _leftWall.frame.size.width/4 + _myHero.frame.size.width/2,0)];


    _myHero.physicsBody = [SKPhysicsBody bodyWithTexture:_myHero.texture size:_myHero.frame.size];
    
    _myHero.physicsBody.affectedByGravity = NO;
    _myHero.physicsBody.dynamic = YES;
//    _myHero.xScale = _myHero.xScale * (-1);
    [_myHero setAnchorPoint:CGPointMake(0, 0)];

    _background = [[SKNode alloc]init];
    _foreground = [[SKNode alloc]init];
    _midground = [[SKNode alloc ]init];
    
//    _leftWall = [[SKSpriteNode alloc]initWithTexture:_textureWall];
//    _lconWall = [[SKSpriteNode alloc ]initWithTexture:_textureWall];
//    _rightWall = [[SKSpriteNode alloc]initWithTexture:_textureWall];
//    _rconWall  = [[SKSpriteNode alloc] initWithTexture:_textureWall];
    
    _leftWall = [[SKSpriteNode alloc]initWithColor:[SKColor cyanColor] size:CGSizeMake(self.frame.size.width/4., self.frame.size.height*2)];
    _rightWall = [[SKSpriteNode alloc]initWithColor:[SKColor purpleColor] size:CGSizeMake(self.frame.size.width/4, self.frame.size.height*2)];
    _lconWall = [[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(self.frame.size.width/4, self.frame.size.height*2)];
    _rconWall = [[SKSpriteNode alloc]initWithColor:[SKColor blackColor] size:CGSizeMake(self.frame.size.width/4, self.frame.size.height*2)];
    

    
//    [_leftWall setTexture:_textureWall];ƒ
//    [_lconWall setTexture:_textureWall];
//    [_rightWall setTexture:_textureWall];
//    [_rconWall setTexture:_textureWall];
    
//    NSLog(@"Left wall : X = %f , Y = %f , posX = %f , posY = %f ",_leftWall.frame.size.width,_leftWall.frame.size.height , _leftWall.position.x , _leftWall.position.y );
//    
//    NSLog(@"Right wall : X = %f , Y = %f , posX = %f , posY = %f ",_rightWall.frame.size.width,_rightWall.frame.size.height , _rightWall.position.x , _rightWall.position.y );
    
    [_leftWall setAnchorPoint:CGPointMake(0.5, 0.0)];
    [_rightWall setAnchorPoint:CGPointMake(0.5, 0.5)];
    [_lconWall setAnchorPoint:CGPointMake(0, 0)];
    [_rconWall setAnchorPoint:CGPointMake(1, 0)];

    [_lconWall setPosition:CGPointMake(0, _leftWall.frame.size.height)];
    [_rightWall setPosition:CGPointMake(self.frame.size.width, 0)];
    [_rconWall setPosition:CGPointMake(_rightWall.frame.size.width, _rightWall.frame.size.height*2)];
       
    [_background addChild:_leftWall];
    [_background addChild:_lconWall];
    [_background addChild:_rightWall];
    [_background addChild:_rconWall];
    
    
    [_foreground addChild:_myHero];
  
    [self addChild:_background];
    [self addChild:_midground];
    [self addChild:_foreground];
    

    
    SKSpriteNode * ground = [[SKSpriteNode alloc]initWithColor:[SKColor brownColor] size:CGSizeMake(self.view.frame.size.width, 50)];
    ground.name = @"ground";
    ground.anchorPoint = CGPointMake(0.0, 0.0);
    ground.position = CGPointMake(0, 0);
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.view.frame.size.width, 50)];
    ground.physicsBody.dynamic = NO ;
    
    uint32_t groundCategory = 0x1 << 1 ;
    uint32_t playerCategory = 0x1 << 2 ;
    
    uint32_t groundCollisionMask = playerCategory | groundCategory;
    uint32_t playerCollisionMask = groundCategory ;
    
    
    
    [ground.physicsBody setCategoryBitMask:groundCategory];
    [ground.physicsBody setCollisionBitMask:groundCollisionMask];
    [ground.physicsBody setContactTestBitMask:groundCategory | playerCategory];
    
    
    ground.physicsBody.allowsRotation = NO;
    ground.physicsBody.affectedByGravity = NO ;
    ground.physicsBody.mass = 100;
    
    [_myHero.physicsBody setCategoryBitMask:playerCollisionMask];
    [_myHero.physicsBody setCollisionBitMask:groundCollisionMask];
    [_myHero.physicsBody setContactTestBitMask:groundCollisionMask | playerCollisionMask];
    
    _myHero.physicsBody.allowsRotation = NO;
    _myHero.physicsBody.mass = 10;

    [_foreground addChild:ground];
    
    NSLog(@"Ground posX = %f , posY = %f , width = %f , height = %f ",ground.position.x , ground.position.y , ground.calculateAccumulatedFrame.size.width , ground.calculateAccumulatedFrame.size.height);
    
  }

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
   
    //    [_myHero.physicsBody applyImpulse:CGVectorMake(0, 10000)];
    
 
        if (_myHero.position.x < self.frame.size.width/2) {
        _isLeft = true;
        _myHero.xScale = _myHero.xScale;
        SKAction *moveTo = [SKAction moveTo:CGPointMake(self.frame.size.width- _rightWall.frame.size.width/2, 0) duration:0.5];
        [_myHero runAction:moveTo];
    }
    else if (_myHero.position.x > self.frame.size.width/2) {
        _isRight = true;
        _myHero.xScale = _myHero.xScale * (-1);
        SKAction *moveTo = [SKAction moveTo:CGPointMake(_leftWall.frame.size.width/2, 0) duration:0.5];
        [_myHero runAction:moveTo];
    }

    //    else _myHero.removeAllActions;
//   
//    NSLog(@"positio of right wall is %f %f", _rightWall.position.x, _rightWall.position.y);
    

//- (void)didBeginContact:(SKPhysicsContact * _Nonnull)contact{
//    
//    SKPhysicsBody * a = contact.bodyA;
//    SKPhysicsBody * b = contact.bodyB;
//    
//    
//    if([a.node.name isEqualToString:@"myHero"]){
//        NSLog(@"Body A = hero, Body B = %@",b.node.name);
//    }
//    
//    
//    
//}
//
//- (void)didEndContact:(SKPhysicsContact * _Nonnull)contact{
//    
//}
}
-(void)update:(CFTimeInterval)currentTime {
 
}

@end
