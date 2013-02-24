//
//  GameXMLProxy.h
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-17.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//XML file parse and store.

#import <UIKit/UIKit.h>
#import "GameVO.h"

@class GameVO;

@interface GameXMLProxy : NSObject <NSXMLParserDelegate>
{
    //A variable string list based on VO;
    NSMutableString *currentElementValue;
	
	NSMutableArray *intros;
	NSMutableArray *images;
    //VO object and array define.
    GameVO *gameVO;
    NSMutableArray *gameVOs;
}

@property(nonatomic,retain) GameVO *gameVO;
@property(nonatomic,retain) NSMutableArray *gameVOs;

-(void)parseXMLFile:(NSString *)path;
@end
