//
//  GameVO.m
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-17.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import "GameVO.h"

@implementation GameVO

@synthesize intro,image;

- (void) dealloc {
	
	[intro release];
	[image release];
	
	[super dealloc];
}

@end
