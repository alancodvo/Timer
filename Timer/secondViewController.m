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
@synthesize selectedTime;

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
    self.nerumadeLabel.text = selectedTime;
}

@end
