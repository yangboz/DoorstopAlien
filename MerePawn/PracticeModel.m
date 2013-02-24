//
//  PracticeModel.m
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-17.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import "PracticeModel.h"

@implementation PracticeModel
//@see http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CocoaFundamentals/CocoaObjects/CocoaObjects.html
//It declares a static instance of your singleton object and initializes it to nil.

static PracticeModel *sharedInstance = nil;
//user setter
static int level=0;
static NSMutableArray *data = nil;
static NSMutableArray *answerItems = nil;
//model calculated
static NSDictionary *rightItems = nil;
static NSDictionary *wrongItems = nil;

//In your class factory method for the class (named something like “sharedInstance” or “sharedManager”), it generates an instance of the class but only if the static instance is nil.
+(PracticeModel *)sharedInstance
{	
	if (sharedInstance==nil) {
		sharedInstance = [[super allocWithZone:NULL] init];
	}
	return sharedInstance;
}
//It overrides the allocWithZone: method to ensure that another instance is not allocated if someone tries to allocate and initialize an instance of your class directly instead of using the class factory method. Instead, it just returns the shared object.
+(id)allocWithZone:(NSZone *)zone
{
	return [ [self sharedInstance] retain];
}
//It implements the base protocol methods copyWithZone:, release, retain, retainCount, and autorelease to do the appropriate things to ensure singleton status. (The last four of these methods apply to memory-managed code, not to garbage-collected code.)
-(id)copyWithZone:(NSZone *)zone
{
	return self;
}

-(id)retain
{
	return self;
}

-(NSUInteger)retainCount
{
	return NSUIntegerMax;//denotes an object that cannot be released.
}

//-(void)release
//{
//	//do nothing.
//}

//implementations
+(int)getLevel
{
	return level;
}

+(void)setLevel:(int)value
{
	level = value;
}

+(NSMutableArray *)getData
{
	return data;
}

+(void)setData:(NSMutableArray *)value
{
	data = value;
}

//Currently
+(void)setAnswerData:(NSMutableArray *)items atIndex:(int)indexValue
{
    if(answerItems==nil)
    {
        answerItems = [NSMutableArray arrayWithObject:items];
    }else {
        [answerItems addObject:items];
    }
}
+(void)checkResult
{
    BOOL result;
    for (int i=0; i<[answerItems count]; i++) {
        NSString *itemStr = (NSString *)[answerItems objectAtIndex:i];
        NSString *fixedAnswer = (NSString *)[[PracticeModel getData] objectAtIndex:[PracticeModel getLevel]];
        result = [itemStr isEqualToString:fixedAnswer];
        if(result)
        {
            if (rightItems == nil) {
                rightItems = [NSDictionary dictionary];
            }
            [rightItems setValue:itemStr forKey:[NSString stringWithFormat:@"%d",i]];
        }else {
            if (wrongItems == nil) {
                wrongItems = [NSDictionary dictionary];
            }
            [wrongItems setValue:itemStr forKey:[NSString stringWithFormat:@"%d",i]];
        }
    }
}
+(NSDictionary *)getRightItems
{
    [PracticeModel checkResult];
    return rightItems;
}
+(NSDictionary *)getWrongItems
{
    [PracticeModel checkResult];
    return wrongItems;
}

@end
