//
//  HelpLayer.m
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-14.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import "PracticeLayer.h"
#import "SceneManager.h"
#import "PracticeModel.h"
#import "PracticeVO.h"
#import "DefaultConsts.h"
#import "SimpleButton.h"
#import "CCScale9Sprite.h"
#import "CCAction.h"

CCSprite *background;
CCMenuItemFont *previous;
CCMenuItemFont *next;

NSMutableArray *answerItems;//Every step.

@implementation PracticeLayer

-(id)init
{		
	self = [super initWithColor:ccc4(255, 255, 255, 255)];
	if (!self) {
		return nil;
	}
    //
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    //Background
    background = [CCSprite spriteWithFile:@"practice_bg.png"];
    [background setPosition: ccp(screenSize.width/2, screenSize.height/2)];
    [self addChild:background];
    // Add the black background
//    CCScale9Sprite *backgroundButton = [CCScale9Sprite spriteWithFile:@"buttonBackground.png"];
//    //    [backgroundButton setContentSize:CGSizeMake(max_w + 14, max_h + 14)];
//    [backgroundButton setContentSize:CGSizeMake(screenSize.width, screenSize.height)];
//    [backgroundButton setPosition:ccp(screenSize.width / 2.0f, screenSize.height / 2.0f)];
//    [self addChild:backgroundButton];

	//Toolbar menu
    previous = [CCMenuItemFont itemFromString:@"<--" target:self selector:@selector(goPrevious:)];
    [previous setColor:ccc3(0, 0, 0)];
    [previous setDisabledColor:ccc3(255,255,255)];
    previous.isEnabled = NO;
	next = [CCMenuItemFont itemFromString:@"-->" target:self selector:@selector(goNext:)];
    [next setColor:ccc3(0, 0, 0)];
    [next setDisabledColor:ccc3(255,255,255)];
	CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"back" target:self selector:@selector(goBack:)];
//    [back setColor:ccc3(0, 0, 0)];
    [back setFontSize:60];
	CCMenu *menu = [CCMenu menuWithItems:back,nil];
    [menu setColor:ccc3(0,0,0)];
	
    //	menu.position = ccp(160,50);
//    menu.anchorPoint = ccp(1.0f,1.0f);
//    menu.position = ccp( screenSize.width/2 + 10.0f, screenSize.height / 2.0f  -370.0f);
    menu.position = ccp(screenSize.width / 2.0f + 250, screenSize.height / 2.0f + 400);
	[menu alignItemsHorizontallyWithPadding:10.0f];
	[menu alignItemsHorizontallyWithPadding:10.0f];
	[self addChild:menu];
    
    //XML proxy process.
    xmlProxy = [PracticeXMLProxy new];
    [xmlProxy parseXMLFile:XML_FILE_PATH_PRACTICE];
    //XML data process.
	NSMutableArray *results = [PracticeModel getData];
	
	NSLog(@"No errors - pratices count : %i", [results count]);
	int currentLevel = [PracticeModel getLevel];
//	currentLevel -= 1;//Array index based on 0; 
	//Add practice id:
	NSString *subjectIndex = [NSString stringWithFormat:@"%d",[PracticeModel getLevel]];
	NSLog(@"subjectIndex is: %@",subjectIndex);
    NSString *totalNum = [NSString stringWithFormat:@"%d", [[PracticeModel getData] count]];
    NSString *indexStr = [subjectIndex stringByAppendingString:@"/"];
    indexStr = [indexStr stringByAppendingString:totalNum];
	CCLabelTTF *indexLabel = [CCLabelTTF labelWithString:indexStr fontName:@"Marker Felt" fontSize:16];
	indexLabel.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f+20);
	[self addChild:indexLabel];
	
	//Add PracticeVO title:
	
	NSString *praticeTitle = [(PracticeVO *)[results objectAtIndex:currentLevel] title];
	//trim whitspace and table new line
//	NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//	praticeTitle = [praticeTitle stringByTrimmingCharactersInSet:whitespace];
	NSLog(@"Title is: %@",praticeTitle);
//	CCLabelTTF *titleLabel = [CCLabelTTF labelWithString:praticeTitle fontName:@"Marker Felt" fontSize:16];
//	titleLabel.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f+100);
//	[self addChild:titleLabel];
    SimpleButton *titleButton = [[SimpleButton alloc] label:praticeTitle fontSize:60];
    [titleButton setEnabled:NO];
    titleButton.anchorPoint = ccp(1.0f, 1.0f);
    titleButton.position = ccp( screenSize.width/2-titleButton.contentSize.width/2 + 50.0f, screenSize.height / 2.0f - titleButton.contentSize.height/2 + 100.0f);
    [self addChild:titleButton];
	
    
	//Add subject result check business:
	NSString *checkResult = [(PracticeVO *)[results objectAtIndex:currentLevel] result];
	NSLog(@"checkResult is: %@",checkResult);
    
    //Circle buttons with label.
    //CircleButtonA
	CCMenuItemImage *circleButtonA = [CCMenuItemImage itemFromNormalImage:@"circle_button_green_up.png" selectedImage:@"circle_button_green_down.png" target:self selector:@selector(answerItemAction:)];
    circleButtonA.anchorPoint = ccp(1.0f, 1.0f);
    NSLog(@"circleButtonA.rect.size.width:%f",circleButtonA.rect.size.width);
    NSLog(@"circleButtonA.rect.size.height:%f",circleButtonA.rect.size.height);
    float circleButtonAX = (0 - circleButtonA.rect.size.width/2.0f - 80.0f);
    float circleButtonAY = (screenSize.height/2.0f - circleButtonA.rect.size.height - 220.0f);
    NSLog(@"circleButtonAX:%f",circleButtonAX);
    NSLog(@"circleButtonAY:%f",circleButtonAY);
    circleButtonA.position = ccp(circleButtonAX,circleButtonAY);
    //CircleButtonB
	CCMenuItemImage *circleButtonB = [CCMenuItemImage itemFromNormalImage:@"circle_button_yellow_up.png" selectedImage:@"circle_button_yellow_down.png" target:self selector:@selector(answerItemAction:)];
    circleButtonB.anchorPoint = ccp(1.0f, 1.0f);
    NSLog(@"circleButtonB.rect.size.width:%f",circleButtonB.rect.size.width);
    NSLog(@"circleButtonB.rect.size.height:%f",circleButtonB.rect.size.height);
    float circleButtonBX = (0 - circleButtonB.rect.size.width/2.0f + 180.0f);
    float circleButtonBY = (screenSize.height/2.0f - circleButtonB.rect.size.height + 30.0f);
    NSLog(@"circleButtonBX:%f",circleButtonBX);
    NSLog(@"circleButtonBY:%f",circleButtonBY);
    circleButtonB.position = ccp(circleButtonBX,circleButtonBY);
    //CircleButtonC
	CCMenuItemImage *circleButtonC = [CCMenuItemImage itemFromNormalImage:@"circle_button_blue_up.png" selectedImage:@"circle_button_blue_down.png" target:self selector:@selector(answerItemAction:)];
    circleButtonC.anchorPoint = ccp(1.0f, 1.0f);
    NSLog(@"circleButtonC.rect.size.width:%f",circleButtonC.rect.size.width);
    NSLog(@"circleButtonC.rect.size.height:%f",circleButtonC.rect.size.height);
    float circleButtonCX = (0 - circleButtonC.rect.size.width/2.0f + 420.0f);
    float circleButtonCY = (screenSize.height/2.0f - circleButtonC.rect.size.height - 220.0f);
    NSLog(@"circleButtonCY:%f",circleButtonCY);
    NSLog(@"circleButtonCY:%f",circleButtonCY);
    circleButtonC.position = ccp(circleButtonCX,circleButtonCY);
    //CircleButtonD
	CCMenuItemImage *circleButtonD = [CCMenuItemImage itemFromNormalImage:@"circle_button_red_up.png" selectedImage:@"circle_button_red_down.png" target:self selector:@selector(answerItemAction:)];
    circleButtonD.anchorPoint = ccp(1.0f, 1.0f);
    NSLog(@"circleButtonD.rect.size.width:%f",circleButtonD.rect.size.width);
    NSLog(@"circleButtonD.rect.size.height:%f",circleButtonD.rect.size.height);
    float circleButtonDX = (0 - circleButtonD.rect.size.width/2.0f + 170.0f);
    float circleButtonDY = (screenSize.height/2.0f - circleButtonD.rect.size.height - 460.0f);
    NSLog(@"circleButtonDY:%f",circleButtonDY);
    NSLog(@"circleButtonDY:%f",circleButtonDY);
    circleButtonD.position = ccp(circleButtonDX,circleButtonDY);
    //Add buttons to scene
	CCMenu *itemMenu = [CCMenu menuWithItems:circleButtonA,circleButtonB,circleButtonC,circleButtonD,nil];
    [self addChild:itemMenu];
    //buttonLabels
    //label data provider
    //Add PracticeVO selections:
	NSString *labels = [(PracticeVO *)[results objectAtIndex:currentLevel] selection];
	//split string to array by the key ","
	NSArray *buttonLabels = [labels componentsSeparatedByString:@","];
    //
    NSString *Alabel = [buttonLabels objectAtIndex:0];
    CCMenuItemFont *buttonAlabel = [CCMenuItemFont itemFromString:[buttonLabels objectAtIndex:0] target:self selector:@selector(answerItemAction:)];
    buttonAlabel.anchorPoint = ccp(1.0f, 1.0f);
    buttonAlabel.position = ccp(circleButtonA.position.x - circleButtonA.rect.size.width/2.0f +20.0f ,circleButtonA.position.y - circleButtonA.rect.size.height/2.0f +30.0f );
    [buttonAlabel setIsEnabled:NO];
//    [buttonAlabel setColor:ccc3(0,0,0)];
//    [buttonAlabel setDisabledColor:ccc3(255, 0, 0)];
    [buttonAlabel setFontSize:80];
    [circleButtonA setUserData:Alabel];
    //
    NSString *Blabel = [buttonLabels objectAtIndex:1];
    CCMenuItemFont *buttonBlabel = [CCMenuItemFont itemFromString:Blabel target:self selector:@selector(answerItemAction:)];
    buttonBlabel.anchorPoint = ccp(1.0f, 1.0f);
    buttonBlabel.position = ccp(circleButtonB.position.x - circleButtonB.rect.size.width/2.0f +20.0f,circleButtonB.position.y - circleButtonB.rect.size.height/2.0f +30.0f);
    [buttonBlabel setDisabledColor:ccc3(255, 255, 255)];
    [buttonBlabel setIsEnabled:NO];
    [buttonBlabel setFontSize:80];
    [circleButtonB setUserData:Blabel];
    //
    NSString *Clabel = [buttonLabels objectAtIndex:2];
    CCMenuItemFont *buttonClabel = [CCMenuItemFont itemFromString:[buttonLabels objectAtIndex:2] target:self selector:@selector(answerItemAction:)];
    buttonClabel.anchorPoint = ccp(1.0f, 1.0f);
    buttonClabel.position = ccp(circleButtonC.position.x - circleButtonC.rect.size.width/2.0f +20.0f,circleButtonC.position.y - circleButtonC.rect.size.height/2.0f +30.0f);
    [buttonClabel setDisabledColor:ccc3(255, 255, 255)];
    [buttonClabel setIsEnabled:NO];
    [buttonClabel setFontSize:80];
    [circleButtonC setUserData:Clabel];
    //
    NSString *Dlabel = [buttonLabels objectAtIndex:3];
    CCMenuItemFont *buttonDlabel = [CCMenuItemFont itemFromString:[buttonLabels objectAtIndex:3] target:self selector:@selector(answerItemAction:)];
    buttonDlabel.anchorPoint = ccp(1.0f, 1.0f);
    buttonDlabel.position = ccp(circleButtonD.position.x - circleButtonD.rect.size.width/2.0f +20.0f,circleButtonD.position.y - circleButtonD.rect.size.height/2.0f +40.0f);
    [buttonDlabel setDisabledColor:ccc3(255, 255, 255)];
    [buttonDlabel setIsEnabled:NO];
    [buttonDlabel setFontSize:80];
    [circleButtonD setUserData:Dlabel];
    //Add buttons' labels to to scene
    CCMenu *buttonLabelMenu = [CCMenu menuWithItems:buttonAlabel,buttonBlabel,buttonClabel,buttonDlabel,nil];
    [self addChild:buttonLabelMenu];
    //Every step answer init.
//	answerItems = [[NSMutableArray alloc]init];
	return self;
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	PracticeLayer *layer = [PracticeLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void)answerItemAction:(id)sender
{
//	NSLog(@"Item selected is:%@",sender);
    CCMenuItemImage *button =  (CCMenuItemImage *)sender;
//    [button setColor:ccc3(0, 0, 255)];
    NSString *currentAnswer = (NSString *)[button userData];
    NSLog(@"Item userdata is:%@",currentAnswer);
//    answerItems = [NSMutableArray arrayWithObject:[button userData]];
    NSMutableArray *results = [PracticeModel getData];
    int currentLevel = [PracticeModel getLevel];
    NSString *rightAnswer = [(PracticeVO *)[results objectAtIndex:currentLevel] result];
    NSLog(@"Current right answer is:%@",rightAnswer);
    if( [currentAnswer isEqualToString:rightAnswer])
    {
        //Display right anser effect.
        //Go to next round.
        //Check result at final step
//        [PracticeModel setAnswerData:answerItems atIndex:[PracticeModel getLevel]];
        if([PracticeModel getLevel]==([[PracticeModel getData] count]-1))//Popup the finally checked result
        {
            //
            UIAlertView *finalResultAlert = [[UIAlertView alloc] init];
            [finalResultAlert setTitle:@"Pracice Complete!!!"];
            //        NSString *rightNum = [NSString stringWithFormat:@"%d",[[PracticeModel getRightItems] count] ];
            //        NSString *totalNum = [NSString stringWithFormat:@"%d",[[PracticeModel getData] count] ];
            //        NSString *msg = [[rightNum stringByAppendingString:@"/"] stringByAppendingString:totalNum];
            [finalResultAlert setMessage:@"You can go to play Morse game now!!!"];
            [finalResultAlert setDelegate:self];
            [finalResultAlert addButtonWithTitle:@"Go to Play"];
            [finalResultAlert addButtonWithTitle:@"Try Again"];
            [finalResultAlert show];
            [finalResultAlert release];
        }else {
            [SceneManager goNext_practice];
            //pre,next btn enable check
            previous.isEnabled = ([PracticeModel getLevel]>0) ;
            next.isEnabled = ([PracticeModel getLevel]<[[PracticeModel getData] count]-1);
        }
    }else {
        [background runAction:[CCTintTo actionWithDuration:10 red:255 green:0 blue:0]];
        [background runAction:[CCBlink actionWithDuration:2 blinks:3]];
    }
}

-(void)goPrevious:(id)sender
{

    [SceneManager goPrevious_practice];
    //pre,next btn enable check
    previous.isEnabled = ([PracticeModel getLevel]>0) ;
    next.isEnabled = ([PracticeModel getLevel]<[[PracticeModel getData] count]-1);
}

-(void)goNext:(id)sender
{
	[SceneManager goNext_practice];
    //pre,next btn enable check
    previous.isEnabled = ([PracticeModel getLevel]>0) ;
    next.isEnabled = ([PracticeModel getLevel]<[[PracticeModel getData] count]-1);
    //Check result at final step
//    [PracticeModel setAnswerData:answerItems atIndex:[PracticeModel getLevel]];
//    if([PracticeModel getLevel]==([[PracticeModel getData] count]-1))//Popup the finally checked result
//    {
//        UIAlertView *finalResultAlert = [[[UIAlertView alloc] init] autorelease];
//        [finalResultAlert setTitle:@"Final Result:"];
//        NSString *rightNum = [NSString stringWithFormat:@"%d",[[PracticeModel getRightItems] count] ];
//        NSString *totalNum = [NSString stringWithFormat:@"%d",[[PracticeModel getData] count] ];
//        NSString *msg = [[rightNum stringByAppendingString:@"/"] stringByAppendingString:totalNum];
//        [finalResultAlert setMessage:msg];
//        [finalResultAlert show];
//    }
}

-(void)goBack:(id)sender
{
	[SceneManager goMainMenu];
    //reset the model level value.
    [PracticeModel setLevel:0];

}
//
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)//Go to Play
    {
        [SceneManager goPlay];
    }
    else if (buttonIndex == 1)//Try again
    {
        [PracticeModel setLevel:0];//reset level.
        [SceneManager goNext_practice];//Go to Practice.
    }
}

@end
