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
    NSString *selectTime;
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
    selectTime = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// DatePickerを動かした時にログを出力するのと、そのフォーマットの指定
- (IBAction)changeDatePicker:(id)sender {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm"];
    NSString *datestr = [df stringFromDate:self.myDatePicker.date];
    NSLog(@"%@", datestr);
}

// ボタンを押した時にDatePickerで取得したデータのフォーマットの指定とアラートの表示
- (IBAction)tapBtn:(id)sender {
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

//アラートの処理
- (void)alertTap:(UIAlertView *)alertTap clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //遷移先ViewControllerクラスのインスタンス生成
    secondViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"secondVC"];
    
    switch (buttonIndex) {
        case 0://押したボタンがCancelなら何もしない
            break;
            
        case 1://押したボタンがOKなら画面遷移
            [self presentViewController:secondVC animated:YES completion:nil ];
            [self performSegueWithIdentifier:@"mySegue" sender:nil ];
            break;
            
    }
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
    NSDateFormatter *df3 = [[NSDateFormatter alloc] init];
    [df3 setDateFormat:@"HH:mm"];
    NSString *datestr3 = [df3 stringFromDate:self.myDatePicker.date];
    selectTime = datestr3;
    // もしセグエの名前がmySegueだったら
    if ( [[segue identifier] isEqualToString:@"mySegue"]) {
        // カウントアップして
        count++;
        // 次の画面へ値を受け渡す
        secondViewController * newVC = [segue destinationViewController];
        newVC.myCount = count;
        newVC.selectedTime = selectTime;
    }
}

@end
