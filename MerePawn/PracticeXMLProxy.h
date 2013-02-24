//
//  PracticeXMLProxy.h
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-17.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//XML file parse and store.

#import <UIKit/UIKit.h>
#import "PracticeVO.h"

@class PracticeVO;

@interface PracticeXMLProxy : NSObject <NSXMLParserDelegate>
{
    //A variable string list based on VO;
    NSMutableString *currentElementValue;
	
	NSMutableArray *titles;
	NSMutableArray *results;
	NSMutableArray *selections;
    //VO object and array define.
    PracticeVO *practiceVO;
    NSMutableArray *practiceVOs;
}

@property(nonatomic,retain) PracticeVO *practiceVO;
@property(nonatomic,retain) NSMutableArray *practiceVOs;

-(void)parseXMLFile:(NSString *)path;
@end
