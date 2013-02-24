//
//  GuiButton.m
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-17.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import "SimpleButton.h"
#import "CCControlExtension.h"

@implementation SimpleButton

- (SimpleButton *)label:(NSString *)labelStr
{
    /** Creates and return a button with a default background and title color. */
    //Default background setting
    
    NSString *upUrlStr = @"button.png";
    NSString *downUrlStr = @"buttonHighlighted.png";
    //
    CCScale9Sprite *backgroundButton = [CCScale9Sprite spriteWithFile:upUrlStr];
    [backgroundButton setPreferedSize:CGSizeMake(45, 45)];  // Set the prefered size
    CCScale9Sprite *backgroundHighlightedButton = [CCScale9Sprite spriteWithFile:downUrlStr];
    [backgroundHighlightedButton setPreferedSize:CGSizeMake(45, 45)];  // Set the prefered size
    
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
    CCLabelTTF *titleButton = [CCLabelTTF labelWithString:labelStr fontName:@"HelveticaNeue-Bold" fontSize:30];
#elif __MAC_OS_X_VERSION_MAX_ALLOWED
    CCLabelTTF *titleButton = [CCLabelTTF labelWithString:labelStr fontName:@"Marker Felt" fontSize:30];
#endif
    [titleButton setColor:ccc3(159, 168, 176)];
    
    SimpleButton *button = [CCControlButton buttonWithLabel:titleButton backgroundSprite:backgroundButton];
    [button setBackgroundSprite:backgroundHighlightedButton forState:CCControlStateHighlighted];
    [button setTitleColor:ccWHITE forState:CCControlStateHighlighted];
    
    return button;

}

- (SimpleButton *)label:(NSString *)labelStr upState:(NSString *)upUrlStr downState:(NSString *)downUrlStr;
{
    /** Creates and return a button with a default background and title color. */
    //Assert the state parameters
    NSAssert((upUrlStr!=nil || downUrlStr!=nil),@"SimpleButton with nil upState or downUrlStr");
    //
    CCScale9Sprite *backgroundButton = [CCScale9Sprite spriteWithFile:upUrlStr];
    [backgroundButton setPreferedSize:CGSizeMake(45, 45)];  // Set the prefered size
    CCScale9Sprite *backgroundHighlightedButton = [CCScale9Sprite spriteWithFile:downUrlStr];
    [backgroundHighlightedButton setPreferedSize:CGSizeMake(45, 45)];  // Set the prefered size
    
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
    CCLabelTTF *titleButton = [CCLabelTTF labelWithString:labelStr fontName:@"HelveticaNeue-Bold" fontSize:30];
#elif __MAC_OS_X_VERSION_MAX_ALLOWED
    CCLabelTTF *titleButton = [CCLabelTTF labelWithString:labelStr fontName:@"Marker Felt" fontSize:30];
#endif
    [titleButton setColor:ccc3(159, 168, 176)];
    
    SimpleButton *button = [CCControlButton buttonWithLabel:titleButton backgroundSprite:backgroundButton];
    [button setBackgroundSprite:backgroundHighlightedButton forState:CCControlStateHighlighted];
    [button setTitleColor:ccWHITE forState:CCControlStateHighlighted];
    
    return button;
}

-(SimpleButton *)label:(NSString *)labelStr fontSize:(CGFloat)fontSizeValue
{
    /** Creates and return a button with a default background and title color. */
    //Default background setting    
    NSString *upUrlStr = @"button.png";
    NSString *downUrlStr = @"buttonHighlighted.png";
    //
    CCScale9Sprite *backgroundButton = [CCScale9Sprite spriteWithFile:upUrlStr];
    [backgroundButton setPreferedSize:CGSizeMake(45, 45)];  // Set the prefered size
    CCScale9Sprite *backgroundHighlightedButton = [CCScale9Sprite spriteWithFile:downUrlStr];
    [backgroundHighlightedButton setPreferedSize:CGSizeMake(45, 45)];  // Set the prefered size
   
    //Default font setting  
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
    NSString *defaultFontName = @"HelveticaNeue-Bold";
#elif __MAC_OS_X_VERSION_MAX_ALLOWED
    NSString *defaultFontName = @"Marker Felt";
#endif

    CCLabelTTF *titleButton = [CCLabelTTF labelWithString:labelStr fontName:defaultFontName fontSize:fontSizeValue];

    [titleButton setColor:ccc3(159, 168, 176)];
    
    SimpleButton *button = [CCControlButton buttonWithLabel:titleButton backgroundSprite:backgroundButton];
    [button setBackgroundSprite:backgroundHighlightedButton forState:CCControlStateHighlighted];
    [button setTitleColor:ccWHITE forState:CCControlStateHighlighted];
    
    return button;
}

@end
