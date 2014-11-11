//
//  stopWatchViewController.h
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/11.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface stopWatchViewController : UIViewController
{
IBOutlet UILabel *time;

NSTimer *timeTicker;
}

@property(nonatomic, retain) UILabel *time;

-(IBAction) strart:(id) sender;
-(IBAction) stop:(id) sender;
-(IBAction) clear:(id) sender;

-(void)showActivity;

@end
