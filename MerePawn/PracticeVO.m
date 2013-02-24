//
//  PracticeVO.m
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-17.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import "PracticeVO.h"

@implementation PracticeVO

@synthesize title,selection,result;


- (void) dealloc {
	
	[title release];
	[selection release];
    [result release];
	
	[super dealloc];
}

@end
