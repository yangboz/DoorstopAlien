//
//  SceneManager.m
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-13.
//  Copyright 2011 GODPAPER. All rights reserved.
//
#import "SceneManager.h"
#import "GameLayer.h"
#import "PracticeLayer.h"
#import "CreditLayer.h"
#import "LearningLayer.h"
#import "LevelTransitionLayer.h"
#import "GameLayer.h"
#import "GameModel.h"
#import "cocos2d.h"
#import "LearningModel.h"
#import "PracticeModel.h"
#import "HelpLayer.h"

@interface SceneManager()

+(void) go:(CCLayer *) layer;
+(CCScene *)wrap:(CCLayer *) layer;

@end



@implementation SceneManager
	
+(void) goMainMenu{
	
	CCLayer *layer = [MainMenuLayer node];
	[SceneManager go: layer];

}

+(void) go:(CCLayer *)layer{
	
	CCDirector *director = [CCDirector sharedDirector];
	CCScene *newScene = [SceneManager wrap:layer];
	if ([director runningScene ]) {
		//transition to main game screen
//		[director replaceScene:[CCTransitionZoomFlipX transitionWithDuration:1.0f scene:newScene]];
//        [director replaceScene:[CCTransitionRotoZoom transitionWithDuration:1.0f scene:newScene]];
        [director replaceScene:newScene];
	}else{
		[director runWithScene:newScene];
	}
}
		 
+(CCScene *) wrap: (CCLayer *)layer{

	CCScene *newScene = [CCScene node];
	[newScene addChild:layer];
    //Uniform background
//    CGSize screenSize = [[CCDirector sharedDirector] winSize];
//    CCSprite *background = [CCSprite spriteWithFile:@"background.png"];
//    [background setPosition: ccp(screenSize.width/2, screenSize.height/2)];
//    [layer addChild:background z:-1];
    
	return newScene;
}

+(void) goPlay
{
	CCLayer *layer = [GameLayer node];
	[SceneManager go: layer];
}

+(void) goPractice
{
	CCLayer *layer = [PracticeLayer node];
	[SceneManager go: layer];
}

+(void) goCredit
{
	CCLayer *layer = [CreditLayer node];
	[SceneManager go: layer];
}

+(void) goLearing
{
	CCLayer *layer = [LearningLayer node];
	[SceneManager go: layer];
}

+(void) goHelp
{
	CCLayer *layer = [HelpLayer node];
	[SceneManager go: layer];
}

+(void) goPrevious_learning
{
	//
	//NSLog(@"level:%i",[LearningModel getLevel]);
	int currentLevel = [LearningModel getLevel];
	if (currentLevel>0) {
		currentLevel--;
		[LearningModel setLevel:currentLevel];
		NSLog(@"level:%i",[LearningModel getLevel]);
		//
		CCLayer *Tlayer = [LevelTransitionLayer node];
		[SceneManager go: Tlayer];
		//
		CCLayer *Llayer = [LearningLayer node];
		[SceneManager go: Llayer];
	}
}

+(void) goNext_learning
{
	//
	//NSLog(@"level:%i",[LearningModel getLevel]);
	int currentLevel = [LearningModel getLevel];
	if (currentLevel < [[LearningModel getData] count]) {
		currentLevel++;
		[LearningModel setLevel:currentLevel];
		//NSLog(@"level:%i",[LearningModel getLevel]);
		CCLayer *Tlayer = [LevelTransitionLayer node];
		[SceneManager go: Tlayer];
		//
		CCLayer *Glayer = [LearningLayer node];
		[SceneManager go: Glayer];
	}	
}

+(void) goPrevious_practice
{
	//
	//NSLog(@"level:%i",[PracticeModel getLevel]);
	int currentLevel = [PracticeModel getLevel];
	if (currentLevel>0) {
		currentLevel--;
		[PracticeModel setLevel:currentLevel];
		NSLog(@"level:%i",[PracticeModel getLevel]);
		//
		CCLayer *Tlayer = [LevelTransitionLayer node];
		[SceneManager go: Tlayer];
		//
		CCLayer *Llayer = [PracticeLayer node];
		[SceneManager go: Llayer];
	}
}

+(void) goNext_practice
{
	//
	//NSLog(@"level:%i",[PracticeModel getLevel]);
	int currentLevel = [PracticeModel getLevel];
	if (currentLevel < [[PracticeModel getData] count]) {
		currentLevel++;
		[PracticeModel setLevel:currentLevel];
		//NSLog(@"level:%i",[PracticeModel getLevel]);
		CCLayer *Tlayer = [LevelTransitionLayer node];
		[SceneManager go: Tlayer];
		//
		CCLayer *Glayer = [PracticeLayer node];
		[SceneManager go: Glayer];
	}	
}

+(void) goPrevious_game
{
	//
	//NSLog(@"level:%i",[GameModel getLevel]);
	int currentLevel = [GameModel getLevel];
	if (currentLevel>0) {
		currentLevel--;
		[LearningModel setLevel:currentLevel];
		NSLog(@"level:%i",[GameModel getLevel]);
		//
		CCLayer *Tlayer = [LevelTransitionLayer node];
		[SceneManager go: Tlayer];
		//
		CCLayer *Llayer = [GameLayer node];
		[SceneManager go: Llayer];
	}
}

+(void) goNext_game
{
	//
	//NSLog(@"level:%i",[GameModel getLevel]);
	int currentLevel = [GameModel getLevel];
	if (currentLevel < [[GameModel getData] count]) {
		currentLevel++;
		[GameModel setLevel:currentLevel];
		//NSLog(@"level:%i",[LearningModel getLevel]);
		CCLayer *Tlayer = [LevelTransitionLayer node];
		[SceneManager go: Tlayer];
		//
		CCLayer *Glayer = [GameLayer node];
		[SceneManager go: Glayer];
	}	
}

@end
