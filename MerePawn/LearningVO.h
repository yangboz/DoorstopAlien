//
//  LearningVO.h
//  DoorstopAlien
//
//  Created by zhou Yangbo on 12-6-17.
//  Copyright (c) 2012年 GODPAPER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LearningVO : NSObject
{
    NSString *cipherText;
    NSString *plainText;
}

@property(nonatomic,retain) NSString *cipherText;
@property(nonatomic,retain) NSString *plainText;

@end
