//
//  ViewController.m
//  Timer
//
//  Created by alan-arakawa-yoshihiro on H27/01/21.
//  Copyright (c) 平成27年 Yoshihiro Arakawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;
- (IBAction)changeDatePicker:(id)sender;
- (IBAction)tapBtn:(id)sender;
- (IBAction)returnMain:(UIStoryboardSegue *)segue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeDatePicker:(id)sender {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm"];
    NSString *datestr = [df stringFromDate:self.myDatePicker.date];
    NSLog(@"%@", datestr);
}

- (IBAction)tapBtn:(id)sender {
    NSDateFormatter *df2 = [[NSDateFormatter alloc] init];
    [df2 setDateFormat:@"HH:mm"];
    NSString *datestr2 = [df2 stringFromDate:self.myDatePicker.date];
    NSLog(@"%@", datestr2);
}

- (IBAction)returnMain:(UIStoryboardSegue *)segue {
    
}

@end
