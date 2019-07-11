//
//  Problem.m
//  LoLQuiz
//
//  Created by Kikuta Yukihiko on 2015/04/17.
//  Copyright (c) 2015年 PEAKHEADZ. All rights reserved.
//

#import "Problem.h"

@interface Problem ()

@end

@implementation Problem{

    //問題画像
    NSString *questionImage;
    NSString *cho1;
    NSString *cho2;
    NSString *cho3;
    NSString *cho4;
    NSString *answer;
}
    //初期化処理
    + (id)initProblem {
        return [[self alloc] init];
    }
    
    //問題と選択肢と答えを格納
    -(void)setQ:(NSString *)q setC1:(NSString *)c1 setC2:(NSString *)c2 setC3:(NSString *)c3 setC4:(NSString *)c4 withA:(NSString *)a {
        
        questionImage = q;
        cho1 = c1;
        cho2 = c2;
        cho3 = c3;
        cho4 = c4;
        answer = a;
    }
    //問題画像を呼び出し
    -(NSString *)getQ{
        return questionImage;
    }
    //選択肢を呼び出し1~4
    -(NSString *)getC1{
        return cho1;
    }
    -(NSString *)getC2{
        return cho2;
    }
    -(NSString *)getC3{
        return cho3;
    }
    -(NSString *)getC4{
        return cho4;
    }
    //答えを呼び出し
    -(NSString *)getA{
        return answer;
    }



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
