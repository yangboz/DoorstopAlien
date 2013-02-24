//
//  MorseButton.h
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-3.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import "CCLabelTTF.h"
#import "CCControlButton.h"
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import "MorseCodeParser.h"

#define TOUCH_UNIT 0.20

@interface MorseButton : CCControlButton <AVAudioPlayerDelegate>
{
    //For morse code parse
    MorseCodeParser *parser;
    //For fixed label text display.
    NSString *ciphertext;
    NSString *plaintext;
    //For dynamic label text process.
    NSString *currentCiphertext;
    NSString *currentPlaintext;
    //For audio play
    AVAudioPlayer *_player;
    BOOL soundEnabled;
    //For dah sound process.
    NSTimer *timer;
    BOOL fingerDown;
    double dateOffset;
    double lastTouchTime;
    double pauseTime;
}
//
@property(nonatomic,retain) NSString *ciphertext;
@property(nonatomic,retain) NSString *plaintext;
@property(nonatomic,retain) NSString *currentCiphertext;
@property(nonatomic,retain) NSString *currentPlaintext;
//
-(void)initialization:(BOOL)boolValue;
//
-(MorseButton *)labelWithPlaintext:(NSString *)text sound:(BOOL)boolValue;
-(MorseButton *)labelWithCiphertext:(NSString *)text sound:(BOOL)boolValue;
//
@property(nonatomic,retain) AVAudioPlayer *_player;
//
@property(nonatomic,retain) NSTimer *timer;

@end
