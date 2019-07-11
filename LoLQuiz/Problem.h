//
//  Problem.h
//  LoLQuiz
//
//  Created by Kikuta Yukihiko on 2015/04/17.
//  Copyright (c) 2015年 PEAKHEADZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Problem : UIViewController

+ (id)initProblem;
-(void)setQ:(NSString *)q setC1:(NSString *)c1 setC2:(NSString *)c2 setC3:(NSString *)c3 setC4:(NSString *)c4 withA:(NSString *)a;
- (NSString *)getQ;
- (NSString *)getC1;
- (NSString *)getC2;
- (NSString *)getC3;
- (NSString *)getC4;
- (NSString *)getA;

@end
