//
//  CCUIViewWrapper.h
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-7-3.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

//  CCUIViewWrapper.h

#import "cocos2d.h"

@interface CCUIViewWrapper : CCSprite
{
	UIView *uiItem;
	float rotation;
}
@property (nonatomic, retain) UIView *uiItem;

+ (id) wrapperForUIView:(UIView*)ui;

- (id) initForUIView:(UIView*)ui;
- (void) updateUIViewTransform;
@end
