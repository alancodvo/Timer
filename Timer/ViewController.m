//

//  ViewController.m

//  Timer

//

//  Created by alan-arakawa-yoshihiro on H27/01/21.

//  Copyright (c) 平成27年 Yoshihiro Arakawa. All rights reserved.

//



#import "ViewController.h"

#import "secondViewController.h"



@interface ViewController () <UIAlertViewDelegate>{
    
    // カウント変数を用意する
    int count;
    NSString *selectTimeHour;
    NSString *selectTimeMinute;
    
}

@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;
- (IBAction)changeDatePicker:(id)sender;
- (IBAction)tapBtn:(id)sender;
- (IBAction)returnMain:(UIStoryboardSegue *)segue;
@property (nonatomic, assign) NSString *selectedTime;

@end



@implementation ViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    // 変数の初期化
    count = 0;
    selectTimeHour = @"";
    selectTimeMinute = @"";
    
    // アプリの起動時に UIApplication の setMinimumBackgroundFetchInterval: メソッドを呼び出し、バックグラウンド実行の要求をする。
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}



// 選択した時刻のフォーマット指定とログ出力

- (IBAction)changeDatePicker:(id)sender {
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm"];
    NSString *datestr = [df stringFromDate:self.myDatePicker.date];
    NSLog(@"%@", datestr);
    
}



// ボタンをタップした時の機能

- (IBAction)tapBtn:(id)sender {
    
    // 選択時刻のフォーマット指定とログ出力
    NSDateFormatter *df2 = [[NSDateFormatter alloc] init];
    [df2 setDateFormat:@"HH:mm"];
    NSString *datestr2 = [df2 stringFromDate:self.myDatePicker.date];
    NSLog(@"%@", datestr2);
    
    
    
    // アラートの設定
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"起床時刻を設定しました。";
    alert.message = datestr2;
    alert.delegate = self;
    [alert addButtonWithTitle:@"キャンセル"];
    [alert addButtonWithTitle:@"OK"];
    [alert show];
    
}





- (IBAction)returnMain:(UIStoryboardSegue *)segue {
    
    // 前の画面から値を受け取って
    secondViewController *newVC = [segue sourceViewController];
    count = newVC.myCount;
    
    // カウントアップして
    count++;
    
    // 表示する
    NSLog(@"カウンター<%d>", count);
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSDateFormatter *dfHour = [[NSDateFormatter alloc] init];
    NSDateFormatter *dfMinute = [[NSDateFormatter alloc] init];
    
    [dfHour setDateFormat:@"HH"];
    [dfMinute setDateFormat:@"mm"];
    
    NSString *datestrHour = [dfHour stringFromDate:self.myDatePicker.date];
    NSString *datestrMinute = [dfMinute stringFromDate:self.myDatePicker.date];
    
    selectTimeHour = datestrHour;
    selectTimeMinute = datestrMinute;
    
    // もしセグエの名前がmySegueだったら
    if ( [[segue identifier] isEqualToString:@"mySegue"]) {
        // カウントアップして
        count++;
        // 次の画面へ値を受け渡す
        secondViewController * newVC = [segue destinationViewController];
        newVC.myCount = count;
        newVC.selectedTimeHour = selectTimeHour;
        newVC.selectedTimeMinute = selectTimeMinute;
    }
}



@end
