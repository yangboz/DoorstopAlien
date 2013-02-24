//
//  SettingsLayer.h
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-14.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"
#import "LearningXMLProxy.h"
#import "iCarousel.h"

@interface LearningLayer : CCLayer <iCarouselDataSource,iCarouselDelegate>{
    LearningXMLProxy *xmlProxy;
    
    NSString *currentPlainText;
}
// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
//iCarousel related
@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, retain) NSString *currentPlainText;
@end
