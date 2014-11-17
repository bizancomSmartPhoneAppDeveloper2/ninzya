//
//  itemViewController.m
//  ninzya
//
//  Created by 吉岡誠史 on 2014/11/17.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "itemViewController.h"

@interface itemViewController ()

@end

@implementation itemViewController

- (void)viewDidLoad
    {
        [super viewDidLoad];
        isFadeIn = YES;
        isFadeIn2 = YES;
        isFadeIn3 = YES;
        //画像を隠す
        self.sampleImageView.hidden =YES;
    }
    
    - (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
    }
    
    - (IBAction)buttonFadeInOut:(id)sender {
        if ([_sampleButton.titleLabel.text isEqualToString:@"使う"]) {
            //画像を表示する
            self.sampleImageView.image = [UIImage imageNamed:@"images.jpg"];
            //フェードイン
            _sampleImageView.alpha = 0;
            //アニメーションのタイプを指定
            [UIView beginAnimations:@"使う" context:nil];
            //イージング指定
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            //アニメーション秒数を指定
            [UIView setAnimationDuration:0.3];
            //目標のアルファ値を指定
            _sampleImageView.alpha = 1;
            //アニメーション実行
            [UIView commitAnimations];
            //ボタンのテキストを変更
            [_sampleButton setTitle:@"戻る" forState:UIControlStateNormal];
            [_sampleButton2 setTitle:@"使う" forState:UIControlStateNormal];
            [_sampleButton3 setTitle:@"使う" forState:UIControlStateNormal];
            
            
            //画像を隠す
            self.sampleImageView.hidden =NO;
            
        }else{
            self.sampleImageView.hidden = YES;
            [self.sampleButton  setTitle:@"使う" forState:UIControlStateNormal];
        }
    }
    
    - (IBAction)buttonFadeInOut2:(id)sender {
         if ([_sampleButton2.titleLabel.text isEqualToString:@"使う"]) {
            //画像を表示する
            self.sampleImageView.image = [UIImage imageNamed:@"images-2.jpg"];
            //フェードイン
            _sampleImageView.alpha = 0;
            //アニメーションのタイプを指定
            [UIView beginAnimations:@"使う" context:nil];
            //イージング指定
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            //アニメーション秒数を指定
            [UIView setAnimationDuration:0.3];
            //目標のアルファ値を指定
            _sampleImageView.alpha = 1;
            //アニメーション実行
            [UIView commitAnimations];
            //ボタンのテキストを変更
            [_sampleButton2 setTitle:@"戻る" forState:UIControlStateNormal];
            [_sampleButton setTitle:@"使う" forState:UIControlStateNormal];
            [_sampleButton3 setTitle:@"使う" forState:UIControlStateNormal];

        self.sampleImageView.hidden =NO;
         }
         else{
             self.sampleImageView.hidden = YES;
             [self.sampleButton2  setTitle:@"使う" forState:UIControlStateNormal];
         }
    }
    - (IBAction)buttonFadeInOut3:(id)sender {
        if ([_sampleButton3.titleLabel.text isEqualToString:@"使う"]) {
            //画像を表示する
            self.sampleImageView.image = [UIImage imageNamed:@"images-1.jpg"];
            //フェードイン
            _sampleImageView.alpha = 0;
            //アニメーションのタイプを指定
            [UIView beginAnimations:@"使う" context:nil];
            //イージング指定
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            //アニメーション秒数を指定
            [UIView setAnimationDuration:0.3];
            //目標のアルファ値を指定
            _sampleImageView.alpha = 1;
            //アニメーション実行
            [UIView commitAnimations];
            //ボタンのテキストを変更
            [_sampleButton3 setTitle:@"戻る" forState:UIControlStateNormal];
            [_sampleButton2 setTitle:@"使う" forState:UIControlStateNormal];
            [_sampleButton setTitle:@"使う" forState:UIControlStateNormal];
        self.sampleImageView.hidden =NO;
        }else{
            self.sampleImageView.hidden = YES;
            [self.sampleButton3  setTitle:@"使う" forState:UIControlStateNormal];
        }
    }

@end