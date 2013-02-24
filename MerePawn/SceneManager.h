//
//  SceneManager.h
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-13.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainMenuLayer.h"


@interface SceneManager : NSObject {
	
}

+(void) goMainMenu;
+(void) goPlay;
+(void) goCredit;
+(void) goPractice;
+(void) goLearing;
+(void) goHelp;

+(void) goPrevious_learning;
+(void) goNext_learning;

+(void) goPrevious_practice;
+(void) goNext_practice;

+(void) goPrevious_game;
+(void) goNext_game;

@end
