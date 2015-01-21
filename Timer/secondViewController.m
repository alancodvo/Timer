//
//  secondViewController.m
//  Timer
//
//  Created by alan-arakawa-yoshihiro on H27/01/21.
//  Copyright (c) 平成27年 Yoshihiro Arakawa. All rights reserved.
//

#import "secondViewController.h"
#import "ViewController.h"

@interface secondViewController () {
    // 選択した時間の変数
    NSString *selectedTime;
}
@property (weak, nonatomic) IBOutlet UILabel *nerumadeLabel;


@end

@implementation secondViewController

@synthesize myCount;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    selectedTime = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    // 2つ目の画面を表示するとき、データを表示する
    NSLog(@"1つ目の画面からのデータ<%d>", myCount);
}

@end
