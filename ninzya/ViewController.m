//
//  ViewController.m
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/11.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    IBOutlet UIImage *size_btn_img_1;
    IBOutlet UIButton *size_btn_1;
    IBOutlet UIImage *size_btn_img_2;
    IBOutlet UIButton *size_btn_2;
    IBOutlet UIImage *size_btn_img_3;
    IBOutlet UIButton *size_btn_3;
    NSInteger size_count;
}
@end

@implementation ViewController

- (void)viewDidLoad {
        //画像を読み込み
        size_btn_img_1 = [UIImage imageNamed:@"btn_1_on.png"];
        size_btn_img_2 = [UIImage imageNamed:@"btn_2_off.png"];
        size_btn_img_3 = [UIImage imageNamed:@"btn_3_off.png"];
        //インスタンス作成
        size_btn_1 = [[UIButton alloc] init];
        size_btn_2 = [[UIButton alloc] init];
        size_btn_3 = [[UIButton alloc] init];
        //各ボタンに画像を設定
        [size_btn_1 setBackgroundImage:size_btn_img_1 forState:UIControlStateNormal];
        [size_btn_2 setBackgroundImage:size_btn_img_2 forState:UIControlStateNormal];
        [size_btn_3 setBackgroundImage:size_btn_img_3 forState:UIControlStateNormal];
        //座標、サイズを指定します。必要に応じて変更してください。
        size_btn_1.frame = CGRectMake(20, 130, 81, 81);
        size_btn_2.frame = CGRectMake(120, 130, 81, 81);
        size_btn_3.frame = CGRectMake(220, 130, 81, 81);
        //viewへ生成
        [size_btn_1 addTarget:self action:@selector(btn1on:) forControlEvents:UIControlEventTouchDown];
        [size_btn_2 addTarget:self action:@selector(btn2on:) forControlEvents:UIControlEventTouchDown];
        [size_btn_3 addTarget:self action:@selector(btn3on:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:size_btn_1];
        [self.view addSubview:size_btn_2];
        [self.view addSubview:size_btn_3];
        
        //デフォルトはボタン1がオンになるようにしておきます。
        size_count = 1;
    }
- (void)btn1on:(id)sender{
    size_count = 1;
    [size_btn_1 setBackgroundImage:[UIImage imageNamed:@"btn_1_on.png"] forState:UIControlStateNormal];
    [size_btn_2 setBackgroundImage:[UIImage imageNamed:@"btn_2_off.png"] forState:UIControlStateNormal];
    [size_btn_3 setBackgroundImage:[UIImage imageNamed:@"btn_3_off.png"] forState:UIControlStateNormal];
    
}
- (void)btn2on:(id)sender{
    size_count = 2;
    [size_btn_1 setBackgroundImage:[UIImage imageNamed:@"btn_1_off.png"] forState:UIControlStateNormal];
    [size_btn_2 setBackgroundImage:[UIImage imageNamed:@"btn_2_on.png"] forState:UIControlStateNormal];
    [size_btn_3 setBackgroundImage:[UIImage imageNamed:@"btn_3_off.png"] forState:UIControlStateNormal];
    
}
- (void)btn3on:(id)sender{
    size_count = 3;
    [size_btn_1 setBackgroundImage:[UIImage imageNamed:@"btn_1_off.png"] forState:UIControlStateNormal];
    [size_btn_2 setBackgroundImage:[UIImage imageNamed:@"btn_2_off.png"] forState:UIControlStateNormal];
    [size_btn_3 setBackgroundImage:[UIImage imageNamed:@"btn_3_on.png"] forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
