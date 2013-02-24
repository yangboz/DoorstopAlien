//
//  LearningVO.m
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-17.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import "LearningVO.h"

@implementation LearningVO

@synthesize cipherText,plainText;


- (void) dealloc {
	
	[cipherText release];
	[plainText release];
	
	[super dealloc];
}

@end
