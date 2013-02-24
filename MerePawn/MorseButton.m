//
//  MorseButton.m
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-3.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import "MorseButton.h"
#import "cocos2d.h"
#import "CCScale9Sprite.h"
#import "CCControlButton.h"

@implementation MorseButton

@synthesize ciphertext,plaintext;
@synthesize currentCiphertext,currentPlaintext;
@synthesize _player;
@synthesize timer;


-(void)initialization:(BOOL)boolValue
{
    //Default variable init
    self.currentCiphertext = [[NSString alloc] initWithString:@""];
    self.currentPlaintext = [[NSString alloc] initWithString:@""];
    parser = [[MorseCodeParser alloc] initWithDictionary];
    //
    soundEnabled = boolValue;
    if (soundEnabled) {
        NSString *tone = [[NSBundle mainBundle] pathForResource:@"dah" ofType:@"aiff"];
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:tone] error:nil];
        [_player setDelegate:self];
        [_player prepareToPlay];
    }
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
//    NSLog(@"ccToucheBegan!!!");
    //time variables init here.
    pauseTime = lastTouchTime?[event timestamp]-lastTouchTime:0;
    lastTouchTime = [event timestamp];
    fingerDown = YES;
    dateOffset = [NSDate timeIntervalSinceReferenceDate]-lastTouchTime;
    //toggle sound if avilable
    if (soundEnabled) {
        [_player play];
    }
    //Timer tick event handler;
    timer = [NSTimer scheduledTimerWithTimeInterval:TOUCH_UNIT/5.0 
                                             target:self 
                                           selector:@selector(reLabel) 
                                           userInfo:nil 
                                            repeats:YES];
    //
    return [super ccTouchBegan:touch withEvent:event];

}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
//    NSLog(@"ccTouchMoved!!!");
    [super ccTouchMoved:touch withEvent:event];
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
//    NSLog(@"ccTouchEnded!!!");
    //custom event
    [_player stop];
    //result delegate handler;
//    [resultDelegate touchDurationReceived:[event timestamp] - lastTouchTime timeFromLastTap:pauseTime];
    double touchDuration = [event timestamp] - lastTouchTime;
    self.currentCiphertext = [NSString stringWithFormat:@"%@%@%@", 
                            self.currentCiphertext, 
                            // UNIT * 7 is a space
                            pauseTime > TOUCH_UNIT * 7 && ![self.currentTitle isEqualToString:@""] ? MORSE_CODE_WORDS_SPERATOR : 
                            // UNIT * 3 is a word break
                            pauseTime > TOUCH_UNIT * 3 && ![self.currentTitle isEqualToString:@""] ? MORSE_CODE_WORD_SPERATOR : @"",
                            // Anything less is a letter segment
                            touchDuration > TOUCH_UNIT ? @"-" : @"."];
    NSLog(@"currentCiphertext:%@",self.currentCiphertext);
    //Cipher text check process.
    parser = [[MorseCodeParser alloc] initWithDictionary];
    self.currentPlaintext = [parser codeToString:self.currentCiphertext];
//    self.currentPlaintext = [MorseParser parseString:self.currentCiphertext];
    NSLog(@"currentPlaintext:%@",self.currentPlaintext);
    //Label check
    
    //timer variable reset
    lastTouchTime  =[event timestamp];
    fingerDown = NO;
    [timer invalidate];
    [self reLabel];
    
    [super ccTouchEnded:touch withEvent:event];
}

- (void) reLabel
{
    if (fingerDown) {
        //
        
    }
}


- (void)dealloc
{
    [_player release];
    [super dealloc];
}

-(MorseButton *)labelWithPlaintext:(NSString *)text sound:(BOOL)boolValue
{
    /** Creates and return a button with a default background and title color. */
    CCScale9Sprite *backgroundButton = [CCScale9Sprite spriteWithFile:@"button.png"];
    CCScale9Sprite *backgroundHighlightedButton = [CCScale9Sprite spriteWithFile:@"buttonHighlighted.png"];
    
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
    CCLabelTTF *plaintextButton = [CCLabelTTF labelWithString:text fontName:@"HelveticaNeue-Bold" fontSize:50];
#elif __MAC_OS_X_VERSION_MAX_ALLOWED
    CCLabelTTF *plaintextButton = [CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:50];
#endif
    [plaintextButton setColor:ccc3(159, 168, 176)];
    
    //
    self.plaintext = text;
    parser = [[MorseCodeParser alloc] initWithDictionary];
    NSString *cipherText = [parser stringToCode:text];
    
    MorseButton *button = [MorseButton buttonWithLabel:plaintextButton backgroundSprite:backgroundButton];
    [button setBackgroundSprite:backgroundHighlightedButton forState:CCControlStateHighlighted];
    [button setTitleColor:ccWHITE forState:CCControlStateHighlighted];
//    [button setTitleLabel:codeButton forState:CCControlStateHighlighted];
    [button setTitle:cipherText forState:CCControlStateHighlighted];
    
    //Keep with sound flag and initial process
    [button initialization:boolValue];
    //
    return button;
}

-(MorseButton *)labelWithCiphertext:(NSString *)text sound:(BOOL)boolValue;
{
    /** Creates and return a button with a default background and title color. */
    CCScale9Sprite *backgroundButton = [CCScale9Sprite spriteWithFile:@"button.png"];
    CCScale9Sprite *backgroundHighlightedButton = [CCScale9Sprite spriteWithFile:@"buttonHighlighted.png"];
    
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
    CCLabelTTF *ciphertextButton = [CCLabelTTF labelWithString:text fontName:@"HelveticaNeue-Bold" fontSize:50];
#elif __MAC_OS_X_VERSION_MAX_ALLOWED
    CCLabelTTF *ciphertextButton = [CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:50];
#endif
    [ciphertextButton setColor:ccc3(159, 168, 176)];
    
    //
    self.ciphertext = text;
    parser = [[MorseCodeParser alloc] initWithDictionary];
    NSString *plainText = [parser codeToString:text];
    
    MorseButton *button = [MorseButton buttonWithLabel:ciphertextButton backgroundSprite:backgroundButton];
    [button setBackgroundSprite:backgroundHighlightedButton forState:CCControlStateHighlighted];
    [button setTitleColor:ccWHITE forState:CCControlStateHighlighted];
    //    [button setTitleLabel:codeButton forState:CCControlStateHighlighted];
    [button setTitle:plainText forState:CCControlStateHighlighted];
    
    //Keep with sound flag and initial process
    [button initialization:boolValue];
    //
    return button;
    
}


@end
