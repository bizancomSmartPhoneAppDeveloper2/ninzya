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
    NSArray *array;
}

- (void)viewDidLoad {
    i = 0;
    p = 0;
    array = [NSArray arrayWithObjects:@"1",@"1", @"0",@"0",nil];
    NSString *kekka = [array objectAtIndex:arc4random()%[array count]];
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
         NSString *kekka = [array objectAtIndex:arc4random()%[array count]];
        if ([kekka isEqualToString:@"1"]) {
            //失敗のとき
            [self performSegueWithIdentifier:@"failsegue" sender:self];
        }
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
    if (app.time > 0) {
        i = app.time;
    }
    i++;
    NSLog(@"%d",i);
    app.time = i;
    self.countLabel.text = [NSString stringWithFormat:@"%d",i];
    if (i >= 30) {
        [self performSegueWithIdentifier:@"sucsesssegue" sender:self];
    }
    [self point];
}
-(void)point{
    if (app.point > 0) {
        p = app.point;
    }
    p = i / 2;
    app.point = p;
   NSLog(@"ポイントは%d",p);
   self.pointup.text = [NSString stringWithFormat:@"%d",p];
        }
-(void)defaultClear{
    
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     NSNumber *num = [NSNumber numberWithInt:app.time];
     [defaults setObject:num forKey:@"経過時間"];
    num = [NSNumber numberWithInt:app.point];
    [defaults setObject:num forKey:@"ポイント"];
    
        }


@end


