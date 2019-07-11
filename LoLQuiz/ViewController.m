//
//  ViewController.m
//  LoLQuiz
//
//  Created by Kikuta Yukihiko on 2015/04/05.
//  Copyright (c) 2015年 PEAKHEADZ. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

/**
 * GameCenterにログインしているか確認処理
 * ログインしていなければログイン画面を表示
 */
- (void)authenticateLocalPlayer
{
    GKLocalPlayer* player = [GKLocalPlayer localPlayer];
    player.authenticateHandler = ^(UIViewController* ui, NSError* error )
    {
        if( nil != ui )
        {
            [self presentViewController:ui animated:YES completion:nil];
            NSLog(@"ログインしてないから");
        }
        
    };
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self authenticateLocalPlayer];
    
    // iAd を生成
    adView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
    
    // 画面(ビュー)の下に表示する場合
    adView.frame = CGRectMake(0, self.view.frame.size.height - adView.frame.size.height, adView.frame.size.width, adView.frame.size.height);
    
    // adViewのフレーム矩形が変更された時にサブビューのサイズを自動的に変更
    adView.autoresizesSubviews = YES;
    
    // 横向き、縦向きに回転した際に、自動的に広告の横幅を調整し、画面上に固定
    // ※画面下に表示する場合は、コメントアウト。
    //adView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    
    // 横向き、縦向きに回転した際に、自動的に広告の横幅を調整し、画面下に固定
    // ※画面上に表示する場合は、コメントアウト。
     adView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    // 非表示にしておく
    adView.alpha = 0.0f;
    
    // ビューに追加
    [self.view addSubview:adView];
    
    // デリゲートをこの UIViewContoroller に渡す
    adView.delegate = self;
    
    
}
// iAdの受信に成功したとき
-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    // バナーが表示されていない場合
    if ( !bannerIsVisible ) {
        // 表示
        banner.alpha = 1.0f;
    }
    // フラグをYESに
    bannerIsVisible = YES;
}

// iAdの受信に失敗したとき
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    // バナーが表示されている場合
    if ( bannerIsVisible ) {
        // 非表示
        banner.alpha = 0.0f;
    }
    // フラグをNOに
    bannerIsVisible = NO;
}

/**
 * ランキングボタンタップ時の処理
 * リーダーボードを表示
 */
- (IBAction)showRanking:(id)sender {
    GKGameCenterViewController *gcView = [GKGameCenterViewController new];
    if (gcView != nil)
    {
        gcView.gameCenterDelegate = self;
        gcView.viewState = GKGameCenterViewControllerStateLeaderboards;
        [self presentViewController:gcView animated:YES completion:nil];
    }
}

/**
 * リーダーボードで完了タップ時の処理
 * 前の画面に戻る
 */
- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
