//
//  AppDelegate.m
//  ggg
//
//  Created by LXY on 16/8/3.
//  Copyright © 2016年 AVGD. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "ViewController.h"
#import "YZGRootNavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //导航控制器
    YZGRootNavigationController *nav = [[YZGRootNavigationController alloc] initWithRootViewController:[ViewController new]];
    self.window.rootViewController = nav;
    
    
    //配置SVP
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setFont:[UIFont boldSystemFontOfSize:16.f]];
    
    //配置IQKeyboardManager
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    //激活
    manager.enable = YES;
    //设置点击View其它位置收回键盘
    manager.shouldResignOnTouchOutside = YES;
    //设置工具栏颜色是否跟文本框一致
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    //激活工具栏
    manager.enableAutoToolbar = YES;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
