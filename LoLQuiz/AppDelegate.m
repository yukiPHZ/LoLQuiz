//
//  AppDelegate.m
//  LoLQuiz
//
//  Created by Kikuta Yukihiko on 2015/04/05.
//  Copyright (c) 2015年 PEAKHEADZ. All rights reserved.
//

#import "AppDelegate.h"
#import "ResultViewController.h"
#import "RankViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize GGP;
@synthesize TwitterText;


void uncaughtExceptionHandler(NSException *exception)
{
    NSLog(@"CRASH: %@", exception);
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    // アプリが起動された時のiphoneの画面サイズを元に利用されているiphoneの型を特定し起動するStoryboardを振分ける
    // height : 480px => iPhone4 or iPhone4S
    // height : 568px => iPhone5 or iPhone5S
    // height : 667px => iPhone6
    // height : 736px => iPhone6plus
    //
    
    // StoryBoardの型宣言
    UIStoryboard *storyboard;
    
    // StoryBoardの名称設定用
    NSString *storyBoardName;
    
    // 機種の取得
    NSString *modelname = [[ UIDevice currentDevice] model];
    
    // iPadでないことの判定
   if ( ![modelname hasPrefix:@"iPad"] ) {
        
        NSLog(@"iphoneの判別OK");
        // 起動されているiPhoneのWindowSizeを取得
        CGRect r = [[UIScreen mainScreen] bounds];
        
        // iPhoneの判定
        if(r.size.height == 480){
            storyBoardName = @"iPhone4_4S";
            NSLog(@"4とか");
        }
        //else if (r.size.height == 568){
        //  storyBoardName = @"iPhone5_5S";
        //}
        else if (r.size.height == 667){
            storyBoardName = @"iPhone6";
            NSLog(@"6");
        }
        else if (r.size.height == 736){
            storyBoardName = @"iPhone6plus";
            NSLog(@"6プラス");
        }
        
        // 上記いづれにも該当しない場合:iPad もしくは iPhone3Sより古いバージョン
        else {
            NSLog(@"%f",r.size.height);
            storyBoardName = @"Main";
            NSLog(@"5とか");
        }
   }else {
       NSLog(@"iPadの判別OK");
       CGRect rr = [[UIScreen mainScreen] bounds];

       NSLog(@"%f",rr.size.height);
       storyBoardName = @"iPhone4_4S";
       NSLog(@"iPad用に4_S");
   }
    // StoryBoardのインスタンス化
    storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    // 画面の生成
    UIViewController *mainViewController = [storyboard instantiateInitialViewController];
    // ルートウィンドウにひっつける
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = mainViewController;
    
    //[self.window setRootViewController: mainViewController];
    [self.window makeKeyAndVisible];
    
    
    
  
    
    self.GGP = [[NSMutableDictionary alloc] init];
    self.TwitterText = [[NSMutableDictionary alloc] init];
    
    NSMutableArray* TTArray0 = [NSMutableArray arrayWithObjects:@"League of LegendsのChampionの名前知らない？",@"League of LegendsのChampionの名前覚えよ？",@"League of LegendsのChampionの名前覚えよ？",@"League of LegendsのChampionは強いんだから！",@"League of LegendsのChampionは有名だよ？",@"League of LegendsのChampionを知ろう！",@"League of LegendsのChampionを覚えよう！",@"League of LegendsのChampionの名前わかる？",@"League of LegendsのChampionの名前わかる？",@"League of LegendsのChampionの名前覚えとこ？", nil];
    NSMutableArray* TTArray1 = [NSMutableArray arrayWithObjects:@"League of LegendsのChampionの名前予習しよう！", @"League of LegendsのChampionの名前復習しよう！", @"League of LegendsのChampionの名前まだまだ知らないみたい", @"League of LegendsにはChampionがいっぱいいるよ！", @"League of LegendsにはChampionがいっぱいいるよ！", @"League of LegendsのChampionは124人！！", @"League of LegendsのChampionは124人！！", @"League of LegendsのChampionはみんな個性的だよ！", @"League of LegendsのChampionを知ってこそ一流プレーヤーだよ！", @"League of LegendsのChampionを知ってこそ病みつきになる！", nil];
    NSMutableArray* TTArray3 = [NSMutableArray arrayWithObjects:@"League of LegendsのChampionの名前すこしずつ覚えてきたね！", @"League of LegendsのChampionの名前はまだまだあるよ！", @"League of LegendsのChampionの名前あと半分！", @"League of LegendsのChampionの名前はどれもかっこいい！", @"League of LegendsのChampionの名前半分も覚えたね！", @"League of LegendsのChampionはみんなスタイリッシュ！！", @"League of LegendsのChampionもみんな名前覚えて欲しいって！", @"League of LegendsのChampionもあと半分！がんばろう！", @"League of LegendsのChampionもあと半分！がんばろう！", @"League of LegendsのChampionは剣も魔法も！それから銃も使う！", @"League of LegendsのChampionは重火器も、兵器も、えーと盾と己の拳も！！", nil];
    NSMutableArray* TTArray5 = [NSMutableArray arrayWithObjects:@"League of LegendsのChampionの名前全部覚えてきた！", @"League of LegendsのChampionもみんな喜んでいるよ！！", @"League of LegendsのChampionの名前もあとちょっと！", @"League of LegendsのChampion124人の名前を覚えたよ！", @"League of LegendsのChampionの名前の次は役割を覚えよう！", @"League of LegendsのChampionの名前の次はスキルを覚えよう！！", @"League of LegendsのChampionのスキンの名前わかる？", @"League of LegendsのChampionの役割は、AssassinにMageにTankにそれからえーっと...", @"League of LegendsのChampionは全員で124人！全部覚えたよ！", @"League of Legendsをプレイしよう！！", nil];
    NSMutableArray* TTArrayTag = [NSMutableArray arrayWithObjects:@"#LeagueOfLegends", @"#LOL", @"#APP", @"#アプリ",@"#クイズ", @"#Quiz", @"#LoLQuiz", @"#PEAKHEADZ", nil];
    [TwitterText setObject:TTArray0 forKey:@"TT0"];
    [TwitterText setObject:TTArray1 forKey:@"TT1"];
    [TwitterText setObject:TTArray3 forKey:@"TT3"];
    [TwitterText setObject:TTArray5 forKey:@"TT5"];
    [TwitterText setObject:TTArrayTag forKey:@"TTTag"];
    
        return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
