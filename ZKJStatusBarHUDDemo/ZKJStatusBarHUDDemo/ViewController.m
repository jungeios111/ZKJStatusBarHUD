//
//  ViewController.m
//  ZKJStatusBarHUDDemo
//
//  Created by ZKJ on 2017/3/24.
//  Copyright © 2017年 ZKJ. All rights reserved.
//

#import "ViewController.h"
#import "ZKJStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)success
{
    [ZKJStatusBarHUD showSuccess:@"交易成功！"];
}

- (IBAction)fail
{
    [ZKJStatusBarHUD showError:@"交易失败！"];
}

- (IBAction)loading
{
    [ZKJStatusBarHUD showLoading:@"正在加载！"];
}

- (IBAction)normal
{
    [ZKJStatusBarHUD showMsg:@"我们赢了！"];
}

- (IBAction)hide
{
    [ZKJStatusBarHUD hide];
}

@end
