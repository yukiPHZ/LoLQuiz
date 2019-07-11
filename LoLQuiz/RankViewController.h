//
//  RankViewController.h
//  LoLQuiz
//
//  Created by Kikuta Yukihiko on 2015/04/13.
//  Copyright (c) 2015年 PEAKHEADZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <GameKit/GameKit.h>
#import <iAd/iAd.h>

@interface RankViewController : UIViewController<GKGameCenterControllerDelegate,ADBannerViewDelegate>{

    NSUserDefaults* userDefaults;
    NSInteger HighScore;
    
    ADBannerView *adView;
    BOOL bannerIsVisible; // 広告表示状態のフラグ
}
@end
