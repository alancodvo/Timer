//
//  Sensor.h
//  Timer
//
//  Created by alan-arakawa-yoshihiro on H27/01/24.
//  Copyright (c) 平成27年 Yoshihiro Arakawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface Sensor : UIViewController {
    CMMotionManager *motionManager;
}
@property(nonatomic, strong) CMMotionManager *motionManager;

@end
