//
//  MorseCode.m
//  MerePawn
//
//  Created by zhou Yangbo on 12-5-13.
//  Copyright (c) 2012年 Godpaper. All rights reserved.
//

#import "MorseCodeParser.h"


/**
 * Reference on the Adobe Dynamic Sound quick start example applications.
 *
 * The class includes a morsePlayString() function, which generates International 
 * Morse Code audio based on a string.
 */
@implementation MorseCodeParser

@synthesize delegate;
//
@synthesize morseCodeDict;

//
//static NSDictionary *_codeList=nil;

//private var codeSound:Sound;			// Used to play the Morse code audio.
id *codeSound;
//private var soundChannel:SoundChannel;  // Used to stop the sound.
id *soundChannel;
//private var soundBytes:ByteArray;		// Used to store the audio sample bytes used by the codeSound object.
Byte *soundBytes;

// Construtor 
// on "init" you need to initialize your instance
-(MorseCodeParser *)initWithDictionary
{
    self = [super init];
    if (self) {
    //Custom variables init here.
    morseCodeDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                   //Letters, numbers, punctuation
                   @"a",@".-", @"b",@"-...", @"c",@"-.-.", @"d",@"-..",@"e",@".", @"f",@"..-.", @"g",@"--.", @"h",@"....",@"i",@"..", @"j",@".---", @"k",@"-.-", @"l",@".-..",@"m",@"--",@"n",@"-.", @"o",@"---", @"p",@".--.",@"q",@"--.-", @"r",@".-.", @"s",@"...", @"t",@"-",@"u",@"..-", @"v",@"...-",@"w",@"..-", @"x",@"-..-",@"y",@"-.--", @"z",@"--..", @"0",@"-----", @"1",@".----",@"2",@"..---", @"3",@"...--", @"4",@"....-", @"5",@".....",@"6",@"-....", @"7",@"--...", @"8",@"---..", @"9",@"----.",@".",@".-.-.-", @",",@"--..--", @"?",@"..--..", @"'",@".---.", @"!",@"-.-.--",
                   // @"/",@"-..-.",
                   @"(",@"-.--.",@")",@"-.--.-",@"&",@".-...",@":",@"---...",@";",@"-.-.-.",@"=",@"-...-",@"+",@".-.-.",@"-",@"-....-",@"_",@"..--.-",@"\"",@".-..-.",@"$",@"...-..-",@"@",@".--.-.",
                   //Prosigns
                   @"Wait",@".-...",@"Error",@".......",@"Understood",@"...-.",@"InvitationToTransmit",@"-.-",@"End of work",@"...-.-",@"Starting Signal",@"-.-.-",
                   //Special seperator, exclude from the morse code dictionary,but also valid Obj-c dictionary key.
                   @" ",@"#",
                    //Non-English extensions to the Morse code
                   @"ä",@".-.-",@"è",@".—..–",@"ñ",@"--.--",@"à",@".--.-",@"é",@"..—..",@"ö",@"---",@"ç",@"-.-..",@"ĝ",@"--.-.",@"ŝ",@"...-.",@"š",@"----",@"ĥ",@"-.--.",@"þ",@".--..",@"ð",@"..--.",@"ĵ",@".---.",@"ü",@"..--",@"ś",@"...-...",@"ź",@"--..-.",@"ż",@"--..-",nil];
    }    
    //
    return self;
}

//private var codeSound:Sound;			// Used to play the Morse code audio.
//private var soundChannel:SoundChannel;  // Used to stop the sound.
//private var soundBytes:ByteArray;		// Used to store the audio sample bytes used by the codeSound object.

//public function MorseCode():void
//{
//}
/**
 * Generates Morse code audio based on a string. The sampleData event handler 
 * for the codeSound object generates audio sample data used by the codeSound object.
 */
//public function playString(string:String):void
-(void)playString:(NSString *)string
{
//    var codeString:String = stringToCode(string);
//    NSString *codeString = [MorseCodeParser stringToCode:string];
//    soundBytes = codeStringToBytes(codeString);    
//    soundBytes.position = 0;
//    codeSound = new Sound();
//    codeSound.addEventListener(SampleDataEvent.SAMPLE_DATA, addSoundBytesToSound);
//    soundChannel = codeSound.play();
//    soundChannel.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
}
/**
 * Notifies the host application that the sound is done playing.
 */
//public function soundCompleteHandler(event:Event):void
-(void)soundCompleteHandler
{
//    dispatchEvent(event);
    //when finish, inform the delegate
//    if ([delegate respondToSelector(@selector(soundCompleteHandler)）]) 
//         [delegate soundCompleteHandler];
}
/**
 * Stops the sound, and notifies the host application that the sound is done playing.
 */
//public function stop():void
-(void)stop
{
//    soundChannel.stop();
//    dispatchEvent(new Event(Event.SOUND_COMPLETE));
//    //when finish, inform the delegate
//    if ([delegate respondToSelector(@selector(soundCompleteHandler)]) 
//         [delegate soundCompleteHandler];
}
/**
 * Converts a String, such as "abc 123", into a Morse code string, such as
 * ".- -... -.-.   .---- ..--- ...--". The codes Array maps characters to
 * their Morse code equivalents.
 */
//public static function stringToCode(string:String):String
-(NSString *)stringToCode:(NSString *)string         
{
//var returnString:String = "";
    NSString *code = MORSE_CODE_WORD_SPERATOR;//FIXME:A solid unknown charactor in morse code dict.
//for (var i:int = 0; i < string.length; i++)
//    for (int i=0; i<[string length]; i++) 
//    {
////        var char:String = string.charAt(i).toLowerCase();
//        unichar character = [string characterAtIndex:i];
//        NSString *charString = [NSString stringWithCharacters:&character length:1];
////        if (codes[char] != undefined)
//        if ([[self codeDictionary] valueForKey:charString]) 
//        {
////            returnString += codes[char] + " ";
//            code = [[[self codeDictionary] valueForKey:charString] stringByAppendingString:@" "];
//        }
//        else
//        {
////            returnString += " ";
//            code = [code stringByAppendingString:@"?"];
//        }
//    }
    code = [[[self morseCodeDict] allKeysForObject:string] objectAtIndex:0];
    return code;
}
-(NSString *)codeToString:(NSString *)code
{
    NSString *resultString = @"";
    //Find any fixed seperator existed.
    NSRange ranger = [code rangeOfString:MORSE_CODE_WORD_SPERATOR];
    if (ranger.location !=NSNotFound) {
        NSArray *letters = [code componentsSeparatedByString:MORSE_CODE_WORD_SPERATOR];
        //
        for (NSString* letter in letters) {
            NSString *dictValue = [[self morseCodeDict] valueForKey:letter];
            resultString = [resultString stringByAppendingString:(dictValue ? dictValue :@"")];
        }
    }else {
        resultString = [[self morseCodeDict] valueForKey:code];
    }
    //
    return resultString;
}
/**
 * Converts a string of Morse code characters, such as "".- -... -.-.", into a byte array
 * of audio data that can be played by a Sound object.
 */
//private function codeStringToBytes(string:String):ByteArray
-(Byte)codeStringToBytes:(NSString *)string
{
//    var returnBytes:ByteArray = new ByteArray();
//    for (var i:int = 0; i < string.length; i++)
//    {
//        var char:String = string.charAt(i);
//        switch (char)
//        {
//            case "." :
//                returnBytes.writeBytes(sineWaveGenerator(1)) 
//                returnBytes.writeBytes(silenceGenerator(1));
//            break;
//            case "-" :
//                returnBytes.writeBytes(sineWaveGenerator(3));
//                returnBytes.writeBytes(silenceGenerator(1));
//            break;
//            default :
//                returnBytes.writeBytes(silenceGenerator(2));
//        }
//    }
//return returnBytes;
}
/**
 * Event handler for the sampleData event, which the codeSound Sound object dispatches
 * to request audio data. The method adds 8192 audio samples to the audio buffer of the
 * Sound object. (Each sample is two four-byte floating point numbers).
 */
//private function addSoundBytesToSound(event:SampleDataEvent):void
-(void)addSoundBytesToSound:(id *)event
{
//    var bytes:ByteArray = new ByteArray();
//    soundBytes.readBytes(bytes, 0, Math.min(soundBytes.bytesAvailable, 8 * 8192));
//    event.data.writeBytes(bytes, 0, bytes.length); 
}
/**
 * Generates sine wave audio data of a specified length. A short Morse code character (".")
 * has lenth == 1, generating a sine wave of 2000 samples. A long Morse code character ("-")
 * has lenth == 3, generating a sine wave of 6000 samples. 
 */
//private function sineWaveGenerator(length:Number):ByteArray 
-(Byte)sineWaveGenerator:(NSNumber *)length
{
//    var returnBytes:ByteArray = new ByteArray();
//    for ( var i:int = 0; i < length * 2400; i++ ) 
//    {
//        var value:Number = Math.sin( i / 6) * 0.5;
//        returnBytes.writeFloat(value);
//        returnBytes.writeFloat(value);
//    }
//    return returnBytes;
}
/**
 * Generates silent audio data of a specified length. 
 */
//private function silenceGenerator(length:Number):ByteArray
-(Byte)silenceGenerator:(NSNumber *)length
{
//    var returnBytes:ByteArray = new ByteArray();
//    for (var i:int=0; i < length * 2400; i++ ) 
//    {
//        returnBytes.writeFloat(0);
//        returnBytes.writeFloat(0);
//    }
//    return returnBytes;
}

@end
