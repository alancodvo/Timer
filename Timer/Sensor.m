//
//  Sensor.m
//  Timer
//
//  Created by alan-arakawa-yoshihiro on H27/01/24.
//  Copyright (c) 平成27年 Yoshihiro Arakawa. All rights reserved.
//

#import "Sensor.h"

@interface Sensor ()

@property(nonatomic, strong) CMMotionManager *motionManager;

@end

@implementation Sensor

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.motionManager = [[CMMotionManager alloc] init];
    if (self.motionManager.accelerometerAvailable)
    {
        // センサーの更新間隔の指定
        self.motionManager.accelerometerUpdateInterval = 1 / 10;  // 10Hz
        
        // ハンドラを指定
        CMAccelerometerHandler handler = ^(CMAccelerometerData *data, NSError *error)
        {
            // 画面に表示
            self.xLabel.text = [NSString stringWithFormat:@"xA %f", data.acceleration.x];
            self.yLabel.text = [NSString stringWithFormat:@"yA %f", data.acceleration.y];
            self.zLabel.text = [NSString stringWithFormat:@"zA %f", data.acceleration.z];
        };
        
        // 加速度の取得開始
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:handler];
    }
    
    if (self.motionManager.gyroAvailable)
    {
        // センサーの更新間隔の指定
        self.motionManager.gyroUpdateInterval = 1 / 10;  // 10Hz
        
        // ハンドラを指定
        CMGyroHandler handlerGyro = ^(CMGyroData *dataGyro, NSError *errorGyro)
        {
            // 画面に表示
            self.xLabelGyro.text = [NSString stringWithFormat:@"xG %f", dataGyro.rotationRate.x];
            self.yLabelGyro.text = [NSString stringWithFormat:@"yG %f", dataGyro.rotationRate.y];
            self.zLabelGyro.text = [NSString stringWithFormat:@"zG %f", dataGyro.rotationRate.z];
        };
        
        // ジャイロの取得開始
        [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:handlerGyro];
    }
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // 加速度の取得停止
    if (self.motionManager.accelerometerActive) {
        [self.motionManager stopAccelerometerUpdates];
    }
    
    // ジャイロの取得停止
    if (self.motionManager.gyroActive) {
        [self.motionManager stopGyroUpdates];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
