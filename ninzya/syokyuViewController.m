//
//  syokyuViewController.m
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/14.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "syokyuViewController.h"
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVFoundation.h>

@interface syokyuViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointup;
@property AVAudioPlayer *mySound;
@end

@implementation syokyuViewController {
    BOOL isVibe;
    NSTimer *myTimer;
    int i;
    int p;
    NSTimer *tm;
    AppDelegate *app; //変数管理
}

- (void)viewDidLoad {
    [super viewDidLoad];
    app = [[UIApplication sharedApplication] delegate]; //変数管理のデリゲート

    // 近接センサをONに
    
    // 近接センサをオン
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    
    // 近接センサ監視
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(proximitySensorStateDidchange:)
                                                 name:UIDeviceProximityStateDidChangeNotification
                                               object:nil];
    //時給を変数に入れる
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *num = [defaults objectForKey:@"経過時間"];
    app.point = [num intValue];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 近接センサの値が変更
- (void)proximitySensorStateDidchange:(NSNotification *)notification {
    if (isVibe == NO)
    {
        isVibe = YES;
        [self soundstart];
        //        [tm fire];
        [self countTimer];
    }
    else
    {
        //止まるメソッド
        isVibe = NO;
        app.point = p;
        app.time = i;
        [myTimer invalidate];
        myTimer = nil;
        [self.mySound stop];
        [tm invalidate];
        tm = nil;
    }
}

-(void)countTimer{
    tm =
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(hogeMethod)
                                   userInfo:nil
                                    repeats:YES
     ];
}

- (void)stopSensor {
    // 近接センサオフ
    [UIDevice currentDevice].proximityMonitoringEnabled = NO;
    // 近接センサ監視解除
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceProximityStateDidChangeNotification                                                  object:nil];
}

-(void)soundstart{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"katana-slash5" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.mySound = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
    [self.mySound play];
    
}

-(void)hogeMethod{
    
    i++;
    NSLog(@"%d",i);
    self.countLabel.text = [NSString stringWithFormat:@"%d",i];
    if (i >= 120) {
        [self performSegueWithIdentifier:@"sucsesssegue" sender:self];
    }
    [self point];
}
-(void)point{

    p = i / 60;
   NSLog(@"ポイントは%d",p);
   self.countLabel.text = [NSString stringWithFormat:@"%d",p];
        }
-(void)defaultClear{
    
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     NSNumber *num = [NSNumber numberWithInt:app.point];
     [defaults setObject:num forKey:@"経過時間"];
    
        }


@end


