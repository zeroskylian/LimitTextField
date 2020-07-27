//
//  ViewController.m
//  LimitTextField
//
//  Created by Xinbo Lian on 2020/7/27.
//  Copyright © 2020 Xinbo Lian. All rights reserved.
//

#import "ViewController.h"
#import "LimitTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LimitTextField *tf = [LimitTextField limitTextFieldWithFrame:CGRectMake(20, 100, 300, 50) limitType:LengthTypeLength limitCount:10];
    tf.borderStyle = UITextBorderStyleLine;
    tf.inputType = LimitInputTypeDoubleDotDecimalNumber;
    [self.view addSubview:tf];
}


@end
