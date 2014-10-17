//
//  ViewController.h
//  FileLogger
//
//  Created by yenkai huang on 2014/10/16.
//  Copyright (c) 2014年 yenkai huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


#import "DLog.h"




@interface ViewController : UIViewController<MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *sendLogBtn;

@end

