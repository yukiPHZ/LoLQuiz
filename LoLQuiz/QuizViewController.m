//
//  QuizViewController.m
//  LoLQuiz
//
//  Created by Kikuta Yukihiko on 2015/04/13.
//  Copyright (c) 2015年 PEAKHEADZ. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end


@implementation QuizViewController{

    //問題（Problemクラスのインスタンス）を格納する配列
    NSMutableArray *problemSet;
    //出題する問題数
    int totalProblems;
    //現在の進捗（出題済み問題数）を記録
    int currentProblem;
    //正答数
    int correctAnswers;
    
    
}



-(void)loadProblemSet {
    //ファイルの読み込み
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Quiz_nomal" ofType:@"csv"]; NSError* error = nil;
    int enc = NSUTF8StringEncoding;
    NSString* text = [NSString stringWithContentsOfFile:path encoding:enc error:&error];
    //行ごとに分割し、配列『lines』に格納
    NSArray* lines = [text componentsSeparatedByString:@"\n"];
                      
    //問題を格納する可変配列のproblemSetを初期化
    problemSet = [[NSMutableArray alloc] init];
    
    //問題の数だけ繰り返し
    for(int i=0; i<[lines count];i++){
    
    //問題をカンマで区切って、要素を配列『items』に格納
    //そしてそのまま問題の0番のみ取得
        NSArray* items = [[lines objectAtIndex:i] componentsSeparatedByString:@","];
    
        
        //そしてそのまま問題の0番を取得、取得した要素が消えないのであれば、答えと問題チャンピオン名を1からそれぞれ取得。同じ要素を取得できないのであれば、1番2番にわける。
        //Problemクラスのインスタンスを生成、初期化し、名前選択肢と答えを格納
        
        Problem *p = [Problem initProblem];
        NSString *q = [items objectAtIndex:0];
        NSString *a = [items objectAtIndex:1];
        NSString *co = [items objectAtIndex:2];
        
        //問題を取得後、要素0番と要素1番を削除
        //さらに配列内をランダムに並び替え
        //0番が連続して削除するのは、要素を削除した時点で要素番号が変わり繰り上がるため
    
        [(NSMutableArray*)items removeObjectsInRange:NSMakeRange(0,3)];
        NSInteger count = [items count];
        for(NSInteger y = count -1; y > 0; y--){
            NSInteger rand = arc4random() % y;
            [(NSMutableArray*)items exchangeObjectAtIndex:y withObjectAtIndex:rand];
            
        }
        
        
        //ランダムご余分な要素全て削除
        //さいど、要素4つをランダムに入れ替える
        [(NSMutableArray*)items removeObjectsInRange:NSMakeRange(3,120)];
        [(NSMutableArray*)items addObject:co];
        NSInteger num = [items count];
        for(NSInteger y = num -1; y > 0; y--){
            NSInteger rand = arc4random() % y;
            [(NSMutableArray*)items exchangeObjectAtIndex:y withObjectAtIndex:rand];
            
        }
        
        //要素を削除するため、要素数が変わる。気をつけて。
        //ランダムに入れ替えた要素を取得。問題パターンをランダムにする。
        
        NSString *c1 = [items objectAtIndex:0];
        NSString *c2 = [items objectAtIndex:1];
        NSString *c3 = [items objectAtIndex:2];
        NSString *c4 = [items objectAtIndex:3];
        
        [p setQ:q setC1:c1 setC2:c2 setC3:c3 setC4:c4 withA:a];
        //新たに生成したProblemクラスのインスタンスをproblemSetに追加
        [problemSet addObject:p];
    }
}

//問題文をシャッフル
-(void)shuffleProblemSet {
    NSInteger mon = [problemSet count];
    for(NSInteger y = mon -1; y > 0; y--){
        NSInteger rand = arc4random() % y;
        [(NSMutableArray*)problemSet exchangeObjectAtIndex:y withObjectAtIndex:rand];
        
    }
  /*
   //problemSetに格納された全問題文の数を取得
    int totalQuestions = (int)[problemSet count];
    //Fisher­Yatesアルゴリズムによって配列の要素をシャッフル
    int i = totalQuestions;
    
    
    
    
    
    //Fisher-Yatesアルゴリズムによって配列の要素をシャッフル
    while (i > 0) {
        //乱数を発生
        srand((unsigned int)time(0));
        int j = rand()%i;
        //要素を並び替え
        [problemSet exchangeObjectAtIndex:(i-1) withObjectAtIndex:j];
        //カウンターを減少させる
        i = i - 1;
    }
   */
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

    //クイズ問題を読み込み
    [self loadProblemSet];
    //クイズ問題をランダムに並び替え（シャッフル）
    [self shuffleProblemSet];
    
    //提示問題数を10問とする
    totalProblems = 10;
    
    //現在の問題番号と正答数を0にする
    currentProblem = 0;
    correctAnswers = 0;
    
    // 画像の読み込み
    UIImage *image = [UIImage imageNamed:[[problemSet objectAtIndex:currentProblem] getQ]];
    problemImage.image = image;
    
    [bc1 setTitle:[[problemSet objectAtIndex:currentProblem] getC1] forState:UIControlStateNormal];
    [bc2 setTitle:[[problemSet objectAtIndex:currentProblem] getC2] forState:UIControlStateNormal];
    [bc3 setTitle:[[problemSet objectAtIndex:currentProblem] getC3] forState:UIControlStateNormal];
    [bc4 setTitle:[[problemSet objectAtIndex:currentProblem] getC4] forState:UIControlStateNormal];
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

//次の問題提示　or 全問時終わっていたら結果表示画面へ
-(void)nextProblem{
    
    //currentProblemを繰り上げ
    currentProblem++;
    
    //これまで出題した問題が、提示問題数に達していない場合
    if (currentProblem < totalProblems) {
        
        //次の問題の問題文を提示
        UIImage *image = [UIImage imageNamed:[[problemSet objectAtIndex:currentProblem] getQ]];
        problemImage.image = image;
        
        [bc1 setTitle:[[problemSet objectAtIndex:currentProblem] getC1] forState:UIControlStateNormal];
        [bc2 setTitle:[[problemSet objectAtIndex:currentProblem] getC2] forState:UIControlStateNormal];
        [bc3 setTitle:[[problemSet objectAtIndex:currentProblem] getC3] forState:UIControlStateNormal];
        [bc4 setTitle:[[problemSet objectAtIndex:currentProblem] getC4] forState:UIControlStateNormal];
        //全問題解き終わった場合
    } else{
    
    //結果表示画面へのSegueを指導
        [self performSegueWithIdentifier:@"toResultView" sender:self];
    }

}

//結果表示画面へのSegueの発動
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //正答率を算出
    int percentage = (correctAnswers * 100 / totalProblems);
    
    //ResultViewController RVCのインスタンスを作成し、
    //RVCクラスのメンバー変数である「correctPercentage』に値を渡す
    if ([[segue identifier] isEqualToString:@"toResultView"]) {
        ResultViewController *rvc = (ResultViewController*)[segue destinationViewController];
        rvc.correctPercentage = percentage;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)choiceText1:(id)sender {
    if ([[[problemSet objectAtIndex:currentProblem] getA] isEqualToString:[[problemSet objectAtIndex:currentProblem] getC1]])  {
        correctAnswers++;
    }
    [self nextProblem];
    
}

- (IBAction)choiceText2:(id)sender {
    if ([[[problemSet objectAtIndex:currentProblem] getA] isEqualToString:[[problemSet objectAtIndex:currentProblem] getC2]])  {
        correctAnswers++;
    }
    [self nextProblem];
}

- (IBAction)choiceText3:(id)sender {
    if ([[[problemSet objectAtIndex:currentProblem] getA] isEqualToString:[[problemSet objectAtIndex:currentProblem] getC3]]) {
        correctAnswers++;
    }
    [self nextProblem];

}

-(IBAction)choiceText4:(id)sender{
    if ([[[problemSet objectAtIndex:currentProblem] getA] isEqualToString:[[problemSet objectAtIndex:currentProblem] getC4]]) {
        correctAnswers++;
    }
      [self nextProblem];
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
