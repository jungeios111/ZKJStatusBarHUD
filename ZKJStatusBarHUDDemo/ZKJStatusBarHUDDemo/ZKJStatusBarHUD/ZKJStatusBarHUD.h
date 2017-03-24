//
//  ZKJStatusBarHUD.h
//  ZKJStatusBarHUD
//
//  Created by ZKJ on 2017/3/24.
//  Copyright © 2017年 ZKJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKJStatusBarHUD : NSObject

/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)showMsg:(NSString *)msg withImage:(UIImage *)image;

/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)success;

/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)error;

/**
 * 显示普通信息
 */
+ (void)showMsg:(NSString *)msg;

/**
 * 显示等待信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 * 隐藏提示
 */
+ (void)hide;

@end
