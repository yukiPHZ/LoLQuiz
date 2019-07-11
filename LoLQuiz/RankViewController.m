//
//  RankViewController.m
//  LoLQuiz
//
//  Created by Kikuta Yukihiko on 2015/04/13.
//  Copyright (c) 2015年 PEAKHEADZ. All rights reserved.
//

#import "RankViewController.h"


@interface RankViewController()

@end

@implementation RankViewController{


    IBOutlet UILabel *totalGGpoints;
    int NowTotalGGpoints;
    
}

- (void) gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}




- (void)viewDidLoad {
    [super viewDidLoad];
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

    
    //ハイスコア取り出し
    userDefaults = [NSUserDefaults standardUserDefaults];
    HighScore = [userDefaults integerForKey:@"HISCORE"];    //NSUserDefaultsから整数値の取り出し
    
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSString *gp = [delegate.GGP objectForKey:@"get"];
    NSInteger getpoint = gp.integerValue;
    
    //NSString *setgp = [delegate.GGP objectForKey:@"set"];
    //NSInteger tgp = setgp.integerValue;
    
    NowTotalGGpoints = (int)HighScore + (int)getpoint;
    totalGGpoints.text = [NSString stringWithFormat:@"%d", NowTotalGGpoints];
    
    //[delegate.GGP setObject:[NSString stringWithFormat:@"%d", NowTotalGGpoints] forKey:@"set"];
    [delegate.GGP removeObjectForKey:@"get"];
    HighScore = NowTotalGGpoints;
    //ハイスコア保存
    [userDefaults setInteger:HighScore forKey:@"HISCORE"];  //NSUserDefaultsに整数値を登録
    [userDefaults synchronize]; //保存
    
    
    if ([GKLocalPlayer localPlayer].isAuthenticated) {
        GKScore* score = [[GKScore alloc] initWithLeaderboardIdentifier:@"LOLQLB"];
        NSLog(@"スコア送信できてる？");
        score.value = 1;
        [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"スコア送信できません");// エラーの場合
            }
        }];
    }
    
    
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
