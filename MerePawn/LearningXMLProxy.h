//
//  LearningXMLProxy.h
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-16.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//XML file parse and store.

#import <UIKit/UIKit.h>
#import "LearningVO.h"

@class LearningVO;

@interface LearningXMLProxy : NSObject <NSXMLParserDelegate>
{
    //A variable string list based on VO;
    NSMutableString *currentElementValue;
	
	NSMutableArray *cipherTexts;
	NSMutableArray *plainTexts;
    
    //VO object and array define.
    LearningVO *learningVO;
    NSMutableArray *learningVOs;
}

@property(nonatomic,retain) LearningVO *learningVO;
@property(nonatomic,retain) NSMutableArray *learningVOs;

-(void)parseXMLFile:(NSString *)path;
@end
