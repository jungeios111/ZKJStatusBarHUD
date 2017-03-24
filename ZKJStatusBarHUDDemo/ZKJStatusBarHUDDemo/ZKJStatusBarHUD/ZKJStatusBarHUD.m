//
//  ZKJStatusBarHUD.m
//  ZKJStatusBarHUD
//
//  Created by ZKJ on 2017/3/24.
//  Copyright © 2017年 ZKJ. All rights reserved.
//

#import "ZKJStatusBarHUD.h"

/** 提示语字号 */
#define HUDFont [UIFont systemFontOfSize:14]
/** 窗口的宽 */
#define WindowW window.frame.size.width
/** 窗口的高 */
#define WindowH window.frame.size.height
/** 消息显示\隐藏的动画时间 */
#define AnimationTime 0.25
/** 消息的停留时间 */
#define WindowStayTime 2.0

@implementation ZKJStatusBarHUD

/** 全局的窗口 */
static UIWindow *window;
/** 全局的定时器 */
static NSTimer *timer;

/** 创建窗口 */
+ (void)showWindow
{
    window.hidden = YES;
    window = [[UIWindow alloc] init];
    window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    window.backgroundColor = [UIColor blueColor];
    window.windowLevel = UIWindowLevelAlert;
    window.hidden = NO;
    window.transform = CGAffineTransformMakeTranslation(0, - WindowH);
    [UIView animateWithDuration:AnimationTime animations:^{
        window.transform = CGAffineTransformIdentity;
    }];
}

/** 显示图片和文字 */
+ (void)showMsg:(NSString *)msg withImage:(UIImage *)image
{
    // 停止上一次的定时器
    [timer invalidate];
    [self showWindow];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, WindowW, WindowH);
    [btn setTitle:msg forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:HUDFont];
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [window addSubview:btn];
    
    // 添加定时器
    timer = [NSTimer scheduledTimerWithTimeInterval:WindowStayTime target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/** 显示成功信息 */
+ (void)showSuccess:(NSString *)success
{
    [self showMsg:success withImage:[UIImage imageNamed:@"ZKJStatusBarHUD.bundle/SuccessBig"]];
}

/** 显示错误信息 */
+ (void)showError:(NSString *)error
{
    [self showMsg:error withImage:[UIImage imageNamed:@"ZKJStatusBarHUD.bundle/errorcircleBig"]];
}

/** 显示普通信息 */
+ (void)showMsg:(NSString *)msg
{
    [self showMsg:msg withImage:nil];
}

/** 显示等待信息 */
+ (void)showLoading:(NSString *)msg
{
    // 停止上一次的定时器
    [timer invalidate];
    timer = nil;
    [self showWindow];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = HUDFont;
    label.frame = CGRectMake(0, 0, WindowW, WindowH);
    [window addSubview:label];
    
    CGFloat msgWidth = [msg boundingRectWithSize:CGSizeMake(WindowW, WindowH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : HUDFont} context:nil].size.width;
    CGFloat centerX = (WindowW - msgWidth) * 0.5 - 5;
    CGFloat centerY = WindowH * 0.5;
    CGFloat labelCenterX = WindowW * 0.5 + 10;
    UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loading startAnimating];
    loading.center = CGPointMake(centerX, centerY);
    label.center = CGPointMake(labelCenterX, centerY);
    [window addSubview:loading];
}

/** 隐藏信息 */
+ (void)hide
{
    [UIView animateWithDuration:AnimationTime animations:^{
        window.transform = CGAffineTransformMakeTranslation(0, - WindowH);
    } completion:^(BOOL finished) {
        window = nil;
        timer = nil;
    }];
}


@end
