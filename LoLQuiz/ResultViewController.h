//
//  ResultViewController.h
//  LoLQuiz
//
//  Created by Kikuta Yukihiko on 2015/04/13.
//  Copyright (c) 2015年 PEAKHEADZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import "AppDelegate.h"
#import <iAd/iAd.h>

@interface ResultViewController : UIViewController<ADBannerViewDelegate>
{
    
    ADBannerView *adView;
    BOOL bannerIsVisible; // 広告表示状態のフラグ
}
@property int correctPercentage;
@property NSString *levelText;
@property NSString *pointText;





@end
