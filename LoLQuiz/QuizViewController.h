//
//  QuizViewController.h
//  LoLQuiz
//
//  Created by Kikuta Yukihiko on 2015/04/13.
//  Copyright (c) 2015年 PEAKHEADZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Problem.h"
#import "ResultViewController.h"
#import <iAd/iAd.h>
@interface QuizViewController : UIViewController<ADBannerViewDelegate>{

    IBOutlet UIImageView *problemImage;
    IBOutlet UIButton *bc1;
    IBOutlet UIButton *bc2;
    IBOutlet UIButton *bc3;
    IBOutlet UIButton *bc4;
    
    ADBannerView *adView;
    BOOL bannerIsVisible; // 広告表示状態のフラグ


}


-(IBAction)choiceText1:(id)sender;
-(IBAction)choiceText2:(id)sender;
-(IBAction)choiceText3:(id)sender;
-(IBAction)choiceText4:(id)sender;

@end
