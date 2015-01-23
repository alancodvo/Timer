//

//  secondViewController.m

//  Timer

//

//  Created by alan-arakawa-yoshihiro on H27/01/21.

//  Copyright (c) 平成27年 Yoshihiro Arakawa. All rights reserved.

//



#import "secondViewController.h"

#import "ViewController.h"



@interface secondViewController ()





@end



@implementation secondViewController



@synthesize myCount;

@synthesize selectedTimeHour;

@synthesize selectedTimeMinute;



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}



- (void)viewWillAppear:(BOOL)animated {
    
    // 2つ目の画面を表示するとき、データを表示する
    
    NSLog(@"1つ目の画面からのデータ<%d>", myCount);
    
    
    
    // 時と分を結合してラベルに表示
    
    selectedTimeHour = [selectedTimeHour stringByAppendingString:@":"];
    
    self.nerumadeLabel.text = [selectedTimeHour stringByAppendingString:selectedTimeMinute];
    
    
    
    [self nerubekiTimeCalculation];
    [self countdounLiveTime];
    
}







// 取得した時刻(NSString)をNSInyegerに変換して15時間足してラベルに寝るべき時間を表示する

- (void)nerubekiTimeCalculation {
    
    // 文字列をNSIntegerに変換
    
    NSInteger nerubekiHour = selectedTimeHour.integerValue + 15;
    
    NSInteger nerubekiMinute = selectedTimeMinute.integerValue + 0;
    
    
    
    // 15時間足した時刻を文字列に変換
    
    // NSIntegerを文字列に変換
    
    NSString *nerubekiHourStr = [NSString stringWithFormat:@"%ld", (long)nerubekiHour];
    
    NSString *nerubekiMinuteStr = [NSString stringWithFormat:@"%ld", (long)nerubekiMinute];
    
    
    
    // 時と分を結合してラベルに表示
    
    nerubekiHourStr = [nerubekiHourStr stringByAppendingString:@":"];
    
    self.neruTimeLabel.text = [nerubekiHourStr stringByAppendingString:nerubekiMinuteStr];
    
}

// 現在時刻の取得と寝るべき時間の比較
- (void)countdounLiveTime {
    // 現在時刻の取得
    NSDate *now = [NSDate date];
    NSLog(@"Current Time %@", [NSDate date]);
}

@end