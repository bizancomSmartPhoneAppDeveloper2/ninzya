//
//  stopWatchViewController.m
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/11.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "stopWatchViewController.h"

@implementation stopWatchViewController

@synthesize time;

-(IBAction) strart:(id) sender{
    timeTicker = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(showActivity) userInfo:nil repeats:YES];
}

-(IBAction) stop:(id) sender{
    [timeTicker invalidate];
}

-(IBAction) clear:(id) sender{
    time.text = @"00.00";
}

-(void)showActivity{
    float currentTime = [time.text floatValue];
    float displayTime = currentTime + 0.01;
    
    time.text = [NSString stringWithFormat:@"%.2f", displayTime];
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
