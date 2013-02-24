//
//  SettingsLayer.m
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-14.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import "LearningLayer.h"
#import <AudioToolbox/AudioToolbox.h>
#import "LearningModel.h"
#import "LearningVO.h"
#import "cocos2d.h"
#import "DefaultConsts.h"
#import "SimpleButton.h"
#import "LearningXMLProxy.h"
#import "CCScale9Sprite.h"
#import "iCarousel.h"
#import "CCUIViewWrapper.h"

@implementation LearningLayer

CCMenuItemFont *previous;
CCMenuItemFont *next;

SimpleButton *cipherTextButton;

@synthesize items;
@synthesize currentPlainText;

-(id)init
{		
	self = [super init];
	if (!self) {
		return nil;
	}
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    //Background
    CCSprite *background = [CCSprite spriteWithFile:@"learning_bg.png"];
    [background setPosition: ccp(screenSize.width/2, screenSize.height/2)];
    [self addChild:background];
//    // Add the black background
//    CCScale9Sprite *backgroundButton = [CCScale9Sprite spriteWithFile:@"buttonBackground.png"];
//    //    [backgroundButton setContentSize:CGSizeMake(max_w + 14, max_h + 14)];
//    [backgroundButton setContentSize:CGSizeMake(screenSize.width, screenSize.height)];
//    [backgroundButton setPosition:ccp(screenSize.width / 2.0f, screenSize.height / 2.0f)];
//    [self addChild:backgroundButton];

    //Toolbar menu
	//
	previous = [CCMenuItemFont itemFromString:@"<--" target:self selector:@selector(goPrevious:)];
    previous.isEnabled = NO;
	next = [CCMenuItemFont itemFromString:@"-->" target:self selector:@selector(goNext:)];
	CCMenuItemFont *back = [CCMenuItemFont itemFromString:@"back" target:self selector:@selector(goBack:)];
//	CCMenu *menu = [CCMenu menuWithItems:previous,back,next,nil];
    [back setFontSize:60];
    CCMenu *menu = [CCMenu menuWithItems:back,nil];
	
    //	menu.position = ccp(160,50);
    menu.position = ccp(screenSize.width / 2.0f + 150, screenSize.height / 2.0f + 400);
	[menu alignItemsHorizontallyWithPadding:10.0f];
	[self addChild:menu];
    
    //XML proxy process.
    xmlProxy = [LearningXMLProxy new];
    [xmlProxy parseXMLFile:XML_FILE_PATH_LEARNING];
    //XML data process.
	NSMutableArray *results = [LearningModel getData];
	NSLog(@"No errors - LearningModel count : %i", [results count]);
    NSLog(@"Some cipher text:%@",[(LearningVO *)[results objectAtIndex:1] cipherText]);
    NSLog(@"Some plain text:%@",[(LearningVO *)[results objectAtIndex:1] plainText]);
    //
	int currentLevel = [LearningModel getLevel];
//	currentLevel -= 1;//Array index based on 0; 
	//Add indexLabel:
	NSString *itemIndex = [NSString stringWithFormat:@"%d",[LearningModel getLevel]];
	NSLog(@"itemIndex is: %@",itemIndex);
    NSString *totalNum = [NSString stringWithFormat:@"%d", [[LearningModel getData] count]];
    NSString *indexStr = [itemIndex stringByAppendingString:@"/"];
    indexStr = [indexStr stringByAppendingString:totalNum];
	CCLabelTTF *indexLabel = [CCLabelTTF labelWithString:indexStr fontName:@"Marker Felt" fontSize:16];
	indexLabel.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f+100);
	[self addChild:indexLabel];
;
	
	//Add cipher text:
	NSString *cipherText = [(LearningVO *)[results objectAtIndex:currentLevel] cipherText];
	//trim whitspace and table new line
//	NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//	cipherText = [cipherText stringByTrimmingCharactersInSet:whitespace];
	NSLog(@"cipherText is: %@",cipherText);
//	CCLabelTTF *cipherTextLabel = [CCLabelTTF labelWithString:cipherText fontName:@"HelveticaNeue-Bold" fontSize:26];
//	cipherTextLabel.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f);
//	[self addChild:cipherTextLabel];
    //
    cipherTextButton = [[SimpleButton alloc] label:cipherText fontSize:100];
    cipherTextButton.anchorPoint = ccp(0.5f, 1);
    cipherTextButton.position = ccp(screenSize.width / 2.0f - cipherTextButton.contentSize.width/2, screenSize.height / 2.0f +150.0);
    [cipherTextButton setEnabled:NO];
    [self addChild:cipherTextButton];

	
	//Add plain text:
    /*
	NSString *plainText = [(LearningVO *)[results objectAtIndex:currentLevel] plainText];
	NSLog(@"plainText is: %@",plainText);
//	CCLabelTTF *plainTextLabel = [CCLabelTTF labelWithString:cipherText fontName:@"HelveticaNeue-Bold" fontSize:26];
//	plainTextLabel.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f+100);
//	[self addChild:plainTextLabel];	
    //
    SimpleButton *plainTextButton = [[SimpleButton alloc] label:plainText ];
    plainTextButton.anchorPoint = ccp(0.5f, 1);
    plainTextButton.position = ccp(screenSize.width / 2.0f, screenSize.height / 2.0f  + 100.0);
    [plainTextButton setEnabled:NO];
    [self addChild:plainTextButton];
     */
    
    //set up icarousel data
    //your carousel should always be driven by an array of
    //data of some kind - don't store data in your item views
    //or the recycling mechanism will destroy your data once
    //your item views move off-screen
    self.items = [NSMutableArray array];
    for (int i = 0; i < [results count]; i++)
    {
//        [items addObject:[NSNumber numberWithInt:i]];
//        NSString *plainText = [NSString stringWithFormat:@"%d",[NSNumber numberWithInt:i]];
        NSString *plainText  = [(LearningVO *)[results objectAtIndex:i] plainText];
        NSLog(@"%d_result text:%@",i,plainText);
        [self.items addObject:plainText];
    }
    //iCarouselView
    iCarousel* carousel = [[iCarousel alloc] initWithFrame:self.boundingBox];
	carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    carousel.type = iCarouselTypeLinear;
	carousel.delegate = self;
	carousel.dataSource = self;
    
	// put a wrappar around it
    CCUIViewWrapper *wrapper = [CCUIViewWrapper wrapperForUIView:carousel];
    wrapper.anchorPoint = ccp(0.5f, 1);
    wrapper.position = ccp(screenSize.width / 2.0f - 400, screenSize.height / 2.0f  + 250.0);
    [self addChild:wrapper];
	
	return self;
}

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	LearningLayer *layer = [LearningLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void)goPrevious:(id)sender
{
	[SceneManager goPrevious_learning];
    //pre,next btn enable check
    previous.isEnabled = ([LearningModel getLevel]>0) ;
    next.isEnabled = ([LearningModel getLevel]<[[LearningModel getData] count]-1);
}

-(void)goNext:(id)sender
{
	[SceneManager goNext_learning];
    //pre,next btn enable check
    previous.isEnabled = ([LearningModel getLevel]>0) ;
    next.isEnabled = ([LearningModel getLevel]<[[LearningModel getData] count]-1);
}


-(void)goBack:(id)sender
{
//    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	[SceneManager goMainMenu];
    //reset the model level value.
    [LearningModel setLevel:0];
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)] autorelease];
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeCenter;
        
        label = [[[UILabel alloc] initWithFrame:view.bounds] autorelease];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
//    label.text = [[items objectAtIndex:index] stringValue];
    label.text = [items objectAtIndex:index];
    
    return view;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    NSLog(@"current carousel item index:%d",carousel.currentItemIndex);
    //
    NSMutableArray *results = [LearningModel getData];
    NSString *cipherText = [(LearningVO *)[results objectAtIndex:carousel.currentItemIndex] cipherText];
    [cipherTextButton setTitle:cipherText forState:CCControlStateNormal];
    //
    [carousel currentItemView].backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:255 alpha:255];
}

@end
