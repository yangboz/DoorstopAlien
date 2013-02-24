//
//  PracticeVO.h
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-17.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PracticeVO : NSObject
{
    NSString *title;
    NSString *selection;
    NSString *result;
}

@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *selection;
@property(nonatomic,retain) NSString *result;

@end
