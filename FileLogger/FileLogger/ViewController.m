//
//  ViewController.m
//  FileLogger
//
//  Created by yenkai huang on 2014/10/16.
//  Copyright (c) 2014年 yenkai huang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DLog(@"test!!!");
    DLog(@"test1!!!");
    DLog(@"test2!!!");
    DLog(@"test3!!!");
    DLog(@"test4!!!");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendLogBtnPress:(id)sender {
    // Email Subject
    NSString *emailTitle = @"Symphony Log";
    // Email Content
    NSString *messageBody = @"Attachment is App.log!";
    // addresss
    NSArray *toRecipents = [NSArray arrayWithObject:@"simplodev@gmail.com"];
    
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
    mailController.mailComposeDelegate = self;
    [mailController setSubject:emailTitle];
    [mailController setMessageBody:messageBody isHTML:NO];
    [mailController setToRecipients:toRecipents];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"APP.log"];
    NSData *logData = [NSData dataWithContentsOfFile:filePath];
    
    [mailController addAttachmentData:logData mimeType:@"text/plain" fileName:@"App.log"];
    
    // Present mail view controller on screen
    [self presentViewController:mailController animated:YES completion:NULL];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
