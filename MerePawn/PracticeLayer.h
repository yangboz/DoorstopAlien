//
//  HelpLayer.h
//  BrainQuiz
//
//  Created by zhou Yangbo on 11-8-14.
//  Copyright 2011 GODPAPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PracticeXMLProxy.h"

@interface PracticeLayer : CCLayerColor {
    PracticeXMLProxy *xmlProxy;
}
// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
@end
