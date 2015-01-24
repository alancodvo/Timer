//
//  Sensor.m
//  Timer
//
//  Created by alan-arakawa-yoshihiro on H27/01/24.
//  Copyright (c) 平成27年 Yoshihiro Arakawa. All rights reserved.
//

#import "Sensor.h"

@interface Sensor ()


@end

@implementation Sensor

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // インスタンスの生成
    self.motionManager = [[CMMotionManager alloc] init];
    
    if (_motionManager.accelerometerAvailable)
    {
        // センサーの更新間隔の指定
        _motionManager.accelerometerUpdateInterval = 1 / 10;  // 10Hz
        
        // ハンドラを指定
        CMAccelerometerHandler handler = ^(CMAccelerometerData *data, NSError *error)
        {
            // 画面に表示
//            self.xLabel.text = [NSString stringWithFormat:@"x %f", data.acceleration.x];
//            self.yLabel.text = [NSString stringWithFormat:@"y %f", data.acceleration.y];
//            self.zLabel.text = [NSString stringWithFormat:@"z %f", data.acceleration.z];
        };
        
        // 加速度の取得開始
        [_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:handler];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // 加速度の取得停止
    if (_motionManager.accelerometerActive) {
        [_motionManager stopAccelerometerUpdates];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
