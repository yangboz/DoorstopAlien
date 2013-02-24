//
//  GameModel.h
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-17.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameModel : NSObject
{}

+(GameModel *)sharedInstance;
+(int)getLevel;
+(void)setLevel:(int)value;

+(NSMutableArray *)getData;
+(void)setData:(NSMutableArray *)value;
@end
