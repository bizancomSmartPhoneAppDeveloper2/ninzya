//
//  itemViewController.h
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/17.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface itemViewController : UIViewController
{
BOOL isFadeIn;
BOOL isFadeIn2;
BOOL isFadeIn3;
}

@property (weak, nonatomic) IBOutlet UIButton *sampleButton;
@property (weak, nonatomic) IBOutlet UIButton *sampleButton2;
@property (weak, nonatomic) IBOutlet UIButton *sampleButton3;
@property (weak, nonatomic) IBOutlet UIImageView *sampleImageView;
- (IBAction)buttonFadeInOut:(id)sender;


@end
