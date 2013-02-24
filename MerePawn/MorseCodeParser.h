//
//  MorseCode.h
//  MerePawn
//
//  Created by zhou Yangbo on 12-5-13.
//  Copyright (c) 2012年 Godpaper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MorseCodeDelegate.h"

#define MORSE_CODE_WORD_SPERATOR @"|"
#define MORSE_CODE_WORDS_SPERATOR @"|#|"

@interface MorseCodeParser : NSObject <MorseCodeDelegate>
{
    NSDictionary *morseCodeDict;
}

/**
 * Generates Morse code audio based on a string. The sampleData event handler 
 * for the codeSound object generates audio sample data used by the codeSound object.
 */

-(void) playString:(NSString *)string;

/**
 * Notifies the host application that the sound is done playing.
 */
//public function soundCompleteHandler(event:Event):void
//+(void)soundCompleteHandler:(
/**
 * Stops the sound, and notifies the host application that the sound is done playing.
 */
//public function stop():void
-(void)stop;

/**
 * Converts a String, such as "abc 123", into a Morse code string, such as
 * ".- -... -.-.   .---- ..--- ...--". The codes Array maps characters to
 * their Morse code equivalents.
 */
//public static function stringToCode(string:String):String
-(NSString *)stringToCode:(NSString *)string;
//
-(NSString *)codeToString:(NSString *)code;

//Objective-c static get/set function for AS3 static variable.
-(MorseCodeParser *)initWithDictionary;
//+(void)setCode:(NSMutableArray *)value;
//Delegate which similar with the AS3 event handler;
@property(retain,nonatomic) id<MorseCodeDelegate> delegate;
//
@property(retain,nonatomic) NSDictionary *morseCodeDict;

@end
