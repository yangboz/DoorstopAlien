//
//  MainMenuLayer.m
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-13.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import "MainMenuLayer.h"
#import "SceneManager.h"
#import "cocos2d.h"
#import "SimpleButton.h"

@implementation MainMenuLayer

-(id)init
{
	self = [super init];
    //
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    //Background
    CCSprite *background = [CCSprite spriteWithFile:@"main_menu_bg.png"];
    [background setPosition: ccp(screenSize.width/2, screenSize.height/2)];
    [self addChild:background];
    
    
	//Main menu title
	CCLabelTTF *title = [CCLabelTTF labelWithString:@"Morser" fontName:@"Marker Felt" fontSize:40];
//    CCLabelBMFont *title = [CCLabelBMFont labelWithString:@"Morser" fntFile:@"mini.fnt"];
    title.color = ccc3(255,215,0);
	title.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f+50);
	[self addChild:title];
    //credit
    CCMenuItemFont *credit = [CCMenuItemFont itemFromString:@"Credits" target:self selector:@selector(onCredits:)];
    //help
    CCMenuItemFont *help = [CCMenuItemFont itemFromString:@"Help" target:self selector:@selector(onHelp:)];
    //
    CCMenu *labelMenu = [CCMenu menuWithItems:credit,help,nil];
    labelMenu.position = ccp(screenSize.width / 2.0f , screenSize.height / 2.0f -50.0f);
//	[labelMenu alignItemsHorizontallyWithPadding:10.0f];
    [labelMenu alignItemsVerticallyWithPadding:30.0f];
    [labelMenu setColor:ccc3(255,255,255)];
	[self addChild:labelMenu];

	
	//Main menu list
    CCMenuItemImage *learning = [CCMenuItemImage itemFromNormalImage:@"button_orange_up.png" selectedImage:@"button_orange_down.png" target:self selector:@selector(onLearning:)];
    learning.anchorPoint = ccp(1.0f, 1.0f);
//    learning.position = ccp(screenSize.width / 4.0f - learning.rect.size.width/2 - 50.f, screenSize.height / 4.0f - learning.rect.size.height/2 + 220.f);
    NSLog(@"screenSize.width:%f",screenSize.width);
    NSLog(@"screenSize.height:%f",screenSize.height);
    NSLog(@"learning.rect.size.width:%f",learning.rect.size.width);
    NSLog(@"learning.rect.size.height:%f",learning.rect.size.height);
    float learningX = (screenSize.width/2.0f - learning.rect.size.width/2.0f - 100.0f);
    float learningY = (screenSize.height/2.0f - learning.rect.size.height + 334.0f);
    NSLog(@"learningX:%f",learningX);
    NSLog(@"learningY:%f",learningY);
    learning.position = ccp(learningX,learningY);
    //
	CCMenuItemImage *newGame = [CCMenuItemImage itemFromNormalImage:@"button_red_up.png" selectedImage:@"button_red_down.png" target:self selector:@selector(onNewGame:)];
    newGame.anchorPoint = ccp(1.0f, 1.0f);
    NSLog(@"newGame.rect.size.width:%f",newGame.rect.size.width);
    NSLog(@"newGame.rect.size.height:%f",newGame.rect.size.height);
    float newGameX = (screenSize.width/2.0f - newGame.rect.size.width/2.0f - 320.0f);
    float newGameY = (screenSize.height/2.0f - newGame.rect.size.height - 153.0f);
    NSLog(@"newGame:%f",newGameX);
    NSLog(@"newGameY:%f",newGameY);
    newGame.position = ccp(newGameX,newGameY);
    //
	CCMenuItemImage *practice = [CCMenuItemImage itemFromNormalImage:@"button_blue_up.png" selectedImage:@"button_blue_down.png" target:self selector:@selector(onPractice:)];
    practice.anchorPoint = ccp(1.0f, 1.0f);
    NSLog(@"practice.rect.size.width:%f",practice.rect.size.width);
    NSLog(@"practice.rect.size.height:%f",practice.rect.size.height);
    float practiceX = (screenSize.width/2.0f - practice.rect.size.width/2.0f + 125.0f);
    float practiceY = (screenSize.height/2.0f - practice.rect.size.height - 163.0f);
    NSLog(@"practiceX:%f",practiceX);
    NSLog(@"practiceY:%f",practiceY);
    practice.position = ccp(practiceX,practiceY);
    //
	CCMenu *mainMenu = [CCMenu menuWithItems:learning,practice,newGame,nil];
	
//	mainMenu.position = ccp(160,200);
    mainMenu.anchorPoint = ccp(0.5f, 0.5f);
    mainMenu.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f);
//	[mainMenu alignItemsVerticallyWithPadding:20.0f];
	[self addChild:mainMenu z:2];
    
    //Gui butttons
//    SimpleButton *guiButton = [[SimpleButton alloc] label:@"AAAA" upState:@"button_orange_up_118X174.png" downState:@"button_orange_down_118X174.png"];
//    guiButton.anchorPoint = ccp(0.5f, 0.5f);
//    guiButton.position = ccp(screenSize.width/2.0f, screenSize.height / 2.0f+200);
//	[self addChild:guiButton];
	
	return self;
}

-(void)onNewGame:(id)sender
{
	[SceneManager goPlay];
}
-(void)onLearning:(id)sender
{
	[SceneManager goLearing];
}
-(void)onPractice:(id)sender
{
	[SceneManager goPractice];
}
-(void)onCredits:(id)sender
{
	[SceneManager goCredit];
}
-(void)onHelp:(id)sender
{
	[SceneManager goHelp];
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainMenuLayer *layer = [MainMenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


@end
