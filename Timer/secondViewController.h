//
//  secondViewController.h
//  Timer
//
//  Created by alan-arakawa-yoshihiro on H27/01/21.
//  Copyright (c) 平成27年 Yoshihiro Arakawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface secondViewController : UIViewController {
    // 受け渡し用の変数
    NSString *selectedTime;
}
@property (nonatomic, assign) NSString *selectedTime;
@end
