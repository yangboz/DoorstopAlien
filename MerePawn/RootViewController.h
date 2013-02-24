//
//  RootViewController.h
//  MerePawn
//
//  Created by zhou Yangbo on 12-5-26.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface RootViewController : UIViewController <MFMailComposeViewControllerDelegate> {

}

-(void)displayComposer;//For email control.

@end
