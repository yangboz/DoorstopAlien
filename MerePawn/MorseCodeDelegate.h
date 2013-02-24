//
//  MorseCodeDelegate.h
//  MerePawn
//
//  Created by zhou Yangbo on 12-5-13.
//  Copyright (c) 2012年 Godpaper. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MorseCodeDelegate <NSObject>

@required
-(void)soundCompleteHandler;

@end
