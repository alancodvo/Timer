//

//  secondViewController.m

//  Timer

//

//  Created by alan-arakawa-yoshihiro on H27/01/21.

//  Copyright (c) 平成27年 Yoshihiro Arakawa. All rights reserved.

//



#import "secondViewController.h"
#import "ViewController.h"
#import "Sensor.h"



@interface secondViewController ()

@property(nonatomic, strong) CMMotionManager *motionManager;

@end



@implementation secondViewController



@synthesize myCount;
@synthesize selectedTimeHour;
@synthesize selectedTimeMinute;



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    if (_motionManager.accelerometerAvailable)
    {
        // センサーの更新間隔の指定
        _motionManager.accelerometerUpdateInterval = 1 / 10;  // 10Hz
        
        // ハンドラを指定
        CMAccelerometerHandler handler = ^(CMAccelerometerData *data, NSError *error)
        {
            // 画面に表示
            self.xLabel.text = [NSString stringWithFormat:@"x %f", data.acceleration.x];
            self.yLabel.text = [NSString stringWithFormat:@"y %f", data.acceleration.y];
            self.zLabel.text = [NSString stringWithFormat:@"z %f", data.acceleration.z];
        };
        
        // 加速度の取得開始
        [_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:handler];
    }
}
    
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // 加速度の取得停止
    if (self.motionManager.accelerometerActive) {
        [self.motionManager stopAccelerometerUpdates];
    }
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
    NSDate *nowTimeGMT = [NSDate date];
    NSDateFormatter *nowTimeDFHour = [[NSDateFormatter alloc] init];
    [nowTimeDFHour setDateFormat:@"HH"];
    NSString *realTimeHourStr = [nowTimeDFHour stringFromDate:nowTimeGMT];
    NSDateFormatter *nowTimeDFMinute = [[NSDateFormatter alloc] init];
    [nowTimeDFMinute setDateFormat:@"mm"];
    NSString *realTimeMinuteStr = [nowTimeDFMinute stringFromDate:nowTimeGMT];

    // 現在時刻の表示
    realTimeHourStr = [realTimeHourStr stringByAppendingString:@":"];
    self.realTimeLabel.text = [realTimeHourStr stringByAppendingString:realTimeMinuteStr];
    
    // 現在時刻と寝るべき時刻の比較から残り時間の算出
    NSInteger realTimeHour = realTimeHourStr.integerValue;
    NSInteger realTimeMinute = realTimeMinuteStr.integerValue;
    
    // 寝るべき時間
    NSInteger nerubekiHour = selectedTimeHour.integerValue + 15;
    NSInteger nerubekiMinute = selectedTimeMinute.integerValue + 0;
    
    // 算出
    NSInteger nerubekiTime = nerubekiHour * 60 + nerubekiMinute;
    NSInteger realTime = realTimeHour * 60 + realTimeMinute;
    NSInteger cdTime = nerubekiTime - realTime;
    NSInteger cdHour = cdTime / 60;
    NSInteger cdMinute = cdTime % 60;
    
    // NSIntegerを文字列に変換
    NSString *cdHourStr = [NSString stringWithFormat:@"%ld", (long)cdHour];
    NSString *cdMinuteStr = [NSString stringWithFormat:@"%ld", (long)cdMinute];

    // 時と分を結合してラベルに表示
    cdHourStr = [cdHourStr stringByAppendingString:@":"];
    self.nokoriTimeLabel.text = [cdHourStr stringByAppendingString:cdMinuteStr];

    

    
    
}

@end