//
//  HelpLayer.m
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-7-8.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import "HelpLayer.h"
#import "cocos2d.h"
#import "SceneManager.h"

@implementation HelpLayer

-(id)init
{		
    self = [super init];
    if (!self) {
        return nil;
    }
    //
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    //Background
    CCSprite *background = [CCSprite spriteWithFile:@"help_bg.png"];
    [background setPosition: ccp(screenSize.width/2, screenSize.height/2)];
    [self addChild:background];
    //back button
    CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"back" target:self selector:@selector(goBack:)];
    back.fontSize = 50;
    //
    CCMenu *backMenu = [CCMenu menuWithItems:back,nil];
    backMenu.position = ccp(screenSize.width / 2.0f , screenSize.height/2.0f -400.0f);
    [backMenu alignItemsVerticallyWithPadding:10.0f];
    [backMenu setColor:ccc3(0,0,0)];
	[self addChild:backMenu];
    
    return self;
}

-(void)goBack:(id)sender
{
    [SceneManager goMainMenu];
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelpLayer *layer = [HelpLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	// return the scene
	return scene;
}

@end
