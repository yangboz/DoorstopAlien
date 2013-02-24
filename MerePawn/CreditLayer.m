//
//  CreditLayer.m
//  MerePawn
//
//  Created by zhou Yangbo on 12-5-26.
//  Copyright 2012年 GODPAPER. All rights reserved.
//

#import "CreditLayer.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"
#import "AppDelegate.h"

@implementation CreditLayer

-(id)init
{		
    self = [super init];
    if (!self) {
        return nil;
    }
    //
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    //Email list
    CCMenuItemFont *email00 = [CCMenuItemFont itemFromString:@"YoungWelle@gmail.com(GameMaster)" target:self selector:nil];
    email00.isEnabled = NO;
    [email00 setDisabledColor:ccc3(66,66, 66)];
    CCMenuItemFont *email01 = [CCMenuItemFont itemFromString:@"nicholas0918.NH@gmail.com(GameDesigner)" target:self selector:nil];
    email01.isEnabled = NO;
    CCMenuItemFont *email02 = [CCMenuItemFont itemFromString:@"fooxcool@gmail.com(GameProgrammer)" target:self selector:nil];
    email02.isEnabled = NO;
    CCMenuItemFont *email03 = [CCMenuItemFont itemFromString:@"yangguangyong@gmail.com(GameCommitter)" target:self selector:nil];
    email03.isEnabled = NO;
    CCMenuItemFont *email04 = [CCMenuItemFont itemFromString:@"zhiqingsuiyue@gmail.com(GameCommitter)" target:self selector:nil];
    email04.isEnabled = NO;
    CCMenuItemFont *email05 = [CCMenuItemFont itemFromString:@"nickxie82@gmail.com(GameArtworksDesigner)" target:self selector:nil];
    email05.isEnabled = NO;
    CCMenuItemFont *sendEmail = [CCMenuItemFont itemFromString:@"Send Email To Us" target:self selector:@selector(sendEmail:)];
    sendEmail.fontSize = 60;
    CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"Go Back" target:self selector:@selector(goBack:)];
    back.fontSize = 50;
    //
    CCMenu *labelMenu = [CCMenu menuWithItems:email05,email04,email03,email02,email01,email00,sendEmail,back,nil];
    labelMenu.position = ccp(screenSize.width / 2.0f , screenSize.height / 2.0f +100.0f);
    //	[labelMenu alignItemsHorizontallyWithPadding:10.0f];
    [labelMenu alignItemsVerticallyWithPadding:30.0f];
    [labelMenu setColor:ccc3(255,255,255)];
	[self addChild:labelMenu];
    
    return self;
}

-(void)goBack:(id)sender
{
//    SimpleAudioEngine *audioEngine = [SimpleAudioEngine sharedEngine];
//    [audioEngine preloadBackgroundMusic:@"Maroon 5 -Payphone.mp3"];
//    [audioEngine playBackgroundMusic:@"Maroon 5 -Payphone.mp3"];
//    [audioEngine preloadEffect:@"beep-7.mp3"];
//    [audioEngine playEffect:@"beep-7.mp3"];
    
    [SceneManager goMainMenu];
}

-(void)sendEmail:(id)sender
{
    [(AppDelegate *)[[UIApplication sharedApplication] delegate] sendEmail];
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	CreditLayer *layer = [CreditLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
     

@end
