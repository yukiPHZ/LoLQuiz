//
//  ViewController.h
//  LoLQuiz
//
//  Created by Kikuta Yukihiko on 2015/04/05.
//  Copyright (c) 2015年 PEAKHEADZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController<GKGameCenterControllerDelegate,ADBannerViewDelegate>{

    ADBannerView *adView;
    BOOL bannerIsVisible; // 広告表示状態のフラグ
}


@end

