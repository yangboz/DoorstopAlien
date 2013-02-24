//
//  GameLayer.m
//  MerePawn
//
//  Created by zhou Yangbo on 12-5-26.
//  Copyright 2012年 GODPAPER. All rights reserved.
//

#import "GameLayer.h"
#import "SceneManager.h"
#import "LevelTransitionLayer.h"
#import "MorseButton.h"
#import "GameModel.h"
#import "CCControlSlider.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation GameLayer

-(id)init
{		
	self = [super init];
	if (!self) {
		return nil;
	}
	// init view
    //
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    //Background
    CCSprite *background = [CCSprite spriteWithFile:@"playing_bg.png"];
    [background setPosition: ccp(screenSize.width/2, screenSize.height/2)];
    [self addChild:background];
	//
//	CCMenuItemFont *previous = [CCMenuItemFont itemFromString:@"<--" target:self selector:@selector(goPrevious:)];
//	CCMenuItemFont *next = [CCMenuItemFont itemFromString:@"-->" target:self selector:@selector(goNext:)];
	CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"back" target:self selector:@selector(goBack:)];
    [back setFontSize:60];
//	CCMenu *menu = [CCMenu menuWithItems:previous,back,next,nil];
	CCMenu *menu = [CCMenu menuWithItems:back,nil];
//	menu.position = ccp(160,50);
    menu.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f - 200.0f);
	[menu alignItemsHorizontallyWithPadding:10.0f];
	[self addChild:menu];
    //
    return self;
    
    //TODO:apply the playing functions.
    MorseButton *plaintextButton = [[MorseButton alloc] labelWithPlaintext:@"e" sound:YES ];
    plaintextButton.anchorPoint = ccp(0.5f, 1);
    plaintextButton.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f);
    [self addChild:plaintextButton];
    //
    MorseButton *ciphertextButton = [[MorseButton alloc] labelWithCiphertext:@".-" sound:NO];
    ciphertextButton.anchorPoint = ccp(0.5f, 1);
    ciphertextButton.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f + 80.0);
    [ciphertextButton setEnabled:NO];
    [self addChild:ciphertextButton];
    //
    MorseButton *soundButton = [[MorseButton alloc] initWithTitle:@"KingJames" fontName:@"HelveticaNeue-Bold" fontSize:30];
    soundButton.anchorPoint = ccp(0.5f, 1);
    soundButton.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f + 140.0);
    [self addChild:soundButton];
//    [soundButton addTarget:self action:@selector(touchDownAction:) forControlEvents:CCControlEventTouchDown];
    
    // Add the slider
    CCControlSlider *slider = [CCControlSlider sliderWithBackgroundFile:@"sliderTrack.png" 
                                                           progressFile:@"sliderProgress.png" 
                                                              thumbFile:@"sliderThumb.png"];
    slider.anchorPoint = ccp(0.5f, 0.5f);
    slider.minimumValue = 0.0f; // Sets the min value of range
    slider.maximumValue = 5.0f; // Sets the max value of range
    slider.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f + 180);
    [self addChild:slider];
    
    return self;
	
	//
	NSMutableArray *results = [GameModel getData];
	
	NSLog(@"No errors - subjects count : %i", [results count]);
	//NSMutableArray *subjectsData = [[GameModel sharedInstance] data];
	//	NSLog(@"Get results from Model:%i",[subjectsData count]);
	int currentLevel = [GameModel getLevel];
	currentLevel -= 1;//Array index based on 0; 
	//Add subject id:
	NSString *subjectIndex = [NSString stringWithFormat:@"%d",[GameModel getLevel]];
	NSLog(@"subjectIndex is: %@",subjectIndex);
	CCLabelTTF *indexLabel = [CCLabelTTF labelWithString:subjectIndex fontName:@"Marker Felt" fontSize:16];
	indexLabel.position = ccp(160,440);
	[self addChild:indexLabel];
	
		
	return self;
}

-(void)goBack:(id)sender
{
	[SceneManager goMainMenu];
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);//It won't work with ipad,ipod,itouch...
}

-(void)goPrevious:(id)sender
{
	[SceneManager goPrevious_game];
}

-(void)goNext:(id)sender
{
	[SceneManager goNext_game];
}

-(void)goCheckResult:(id)sender
{
	NSLog(@"Item selected is:%@",sender);
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [[GameLayer layerWithColor:ccc4(255,0,0,255)] node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}



@end

