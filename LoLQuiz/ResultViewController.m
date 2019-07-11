//
//  ResultViewController.m
//  LoLQuiz
//
//  Created by Kikuta Yukihiko on 2015/04/13.
//  Copyright (c) 2015年 PEAKHEADZ. All rights reserved.
//

#import "ResultViewController.h"


@interface ResultViewController ()

@end

@implementation ResultViewController{

 //各種ラベル
    IBOutlet UILabel *percentageLabel;
    IBOutlet UILabel *levelLabel;
    IBOutlet UILabel *ggpointLabel;
    IBOutlet UIButton *forTwitter;
    
    NSString* TText;
    NSArray* TTag;
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

    
    //正答率に応じてレベルテキストを設定
    if (_correctPercentage < 20) {
        levelLabel.text = @"Oh...Majide?";
        _levelText = @"Oh...Majide?";
        ggpointLabel.text = @"0";
        _pointText = @"0";
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        [delegate.GGP setObject:@"0" forKey:@"get"];
        NSMutableArray* TTarray = [delegate.TwitterText objectForKey:@"TT0"];
        NSMutableArray* TTagray = [delegate.TwitterText objectForKey:@"TTTag"];
        NSInteger count = [TTarray count];
        for(NSInteger i = count - 1; i > 0; i--){
            NSInteger rand = arc4random() % i;
            [TTarray exchangeObjectAtIndex:i withObjectAtIndex:rand];
            TText = [TTarray objectAtIndex:5];
        }
        NSInteger count1 = [TTagray count];
        for(NSInteger i = count1 - 1; i > 0; i--){
            NSInteger rand = arc4random() % i;
            [TTagray exchangeObjectAtIndex:i withObjectAtIndex:rand];
            NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0,3)];
            TTag = [TTagray objectsAtIndexes:set];
        }
        
    } else if (_correctPercentage >= 20 && _correctPercentage < 50) {
        levelLabel.text = @"Are you OK?";
        _levelText = @"Are you OK?";
        ggpointLabel.text = @"1";
        _pointText = @"1";
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        [delegate.GGP setObject:@"1" forKey:@"get"];
        NSMutableArray* TTarray = [delegate.TwitterText objectForKey:@"TT1"];
        NSMutableArray* TTagray = [delegate.TwitterText objectForKey:@"TTTag"];
        NSInteger count = [TTarray count];
        for(NSInteger i = count - 1; i > 0; i--){
            NSInteger rand = arc4random() % i;
            [TTarray exchangeObjectAtIndex:i withObjectAtIndex:rand];
            TText = [TTarray objectAtIndex:5];
        }
        NSInteger count1 = [TTagray count];
        for(NSInteger i = count1 - 1; i > 0; i--){
            NSInteger rand = arc4random() % i;
            [TTagray exchangeObjectAtIndex:i withObjectAtIndex:rand];
            NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0,3)];
            TTag = [TTagray objectsAtIndexes:set];
        }


        
    } else if (_correctPercentage >= 50 && _correctPercentage < 100) {
        levelLabel.text = @"Good Game!!";
        _levelText = @"Good Game!!";
        ggpointLabel.text = @"2";
        _pointText = @"2";
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        [delegate.GGP setObject:@"2" forKey:@"get"];
        NSMutableArray* TTarray = [delegate.TwitterText objectForKey:@"TT3"];
        NSMutableArray* TTagray = [delegate.TwitterText objectForKey:@"TTTag"];
        NSInteger count = [TTarray count];
        for(NSInteger i = count - 1; i > 0; i--){
            NSInteger rand = arc4random() % i;
            [TTarray exchangeObjectAtIndex:i withObjectAtIndex:rand];
            TText = [TTarray objectAtIndex:5];
        }
        NSInteger count1 = [TTagray count];
        for(NSInteger i = count1 - 1; i > 0; i--){
            NSInteger rand = arc4random() % i;
            [TTagray exchangeObjectAtIndex:i withObjectAtIndex:rand];
            NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0,3)];
            TTag = [TTagray objectsAtIndexes:set];
        }

        

        
    } else if (_correctPercentage >= 100){
        levelLabel.text = @"It's Perfect!!";
        _levelText = @"It's Perfect!!";
        ggpointLabel.text = @"5";
        _pointText = @"5";
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        [delegate.GGP setObject:@"5" forKey:@"get"];
        NSMutableArray* TTarray = [delegate.TwitterText objectForKey:@"TT5"];
        NSMutableArray* TTagray = [delegate.TwitterText objectForKey:@"TTTag"];
        NSInteger count = [TTarray count];
        for(NSInteger i = count - 1; i > 0; i--){
            NSInteger rand = arc4random() % i;
            [TTarray exchangeObjectAtIndex:i withObjectAtIndex:rand];
            TText = [TTarray objectAtIndex:5];
        }
        NSInteger count1 = [TTagray count];
        for(NSInteger i = count1 - 1; i > 0; i--){
            NSInteger rand = arc4random() % i;
            [TTagray exchangeObjectAtIndex:i withObjectAtIndex:rand];
            NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0,3)];
            TTag = [TTagray objectsAtIndexes:set];
        }
    }
    
    //実際の正答率を表示
    percentageLabel.text = [NSString stringWithFormat:@"%d", _correctPercentage];
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




- (IBAction)forTwitter:(id)sender {
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ツイートエラー"
                                                        message:@"Twitterアカウントが設定されていません。"
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
        return;
    }
    
    
    NSMutableString *text = [NSMutableString stringWithCapacity: 0];
    [text appendString:@"『"];
    [text appendString:_levelText];
    [text appendString:@"』LoL Quizに挑戦！！正答率"];
    [text appendString:[NSString stringWithFormat:@"『%d", _correctPercentage]];
    [text appendString:@"％』で『"];
    [text appendString:_pointText];
    [text appendString:@"GGpoint』獲得しました！！ "];
    [text appendString:TText];
    [text appendString:[TTag componentsJoinedByString:@" "]];
    
    NSURL *URL = [NSURL URLWithString:@"アプリのURL"];
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"hogehoge"]];
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [controller setInitialText:text];
    [controller addURL:URL];
    [controller addImage:[[UIImage alloc] initWithData:imageData]];
    controller.completionHandler =^(SLComposeViewControllerResult result){
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    [self presentViewController:controller animated:YES completion:nil];
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
