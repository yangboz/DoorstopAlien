//
//  GuiButton.h
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-17.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import "CCControlButton.h"

@interface SimpleButton : CCControlButton
{}

-(SimpleButton *)label:(NSString *)labelStr;
-(SimpleButton *)label:(NSString *)labelStr fontSize:(CGFloat)sizeValue ;
-(SimpleButton *)label:(NSString *)labelStr upState:(NSString *)upUrlStr downState:(NSString *)downUrlStr;

@end
