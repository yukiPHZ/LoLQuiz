//
//  AppDelegate.h
//  LoLQuiz
//
//  Created by Kikuta Yukihiko on 2015/04/05.
//  Copyright (c) 2015年 PEAKHEADZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{

    NSMutableDictionary* GGP;
    NSMutableDictionary* TwitterText;

}


@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSMutableDictionary* GGP;
@property (strong, nonatomic) NSMutableDictionary* TwitterText;

@end

