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
    
    int myCount;
    
    NSString *selectedTimeHour;
    
    NSString *selectedTimeMinute;
    
}

@property (nonatomic, assign) int myCount;

@property (nonatomic, copy) NSString *selectedTimeHour;

@property (nonatomic, copy) NSString *selectedTimeMinute;

@property (weak, nonatomic) IBOutlet UILabel *nerumadeLabel;

@property (weak, nonatomic) IBOutlet UILabel *neruTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *realTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nokoriTimeLabel;

@end