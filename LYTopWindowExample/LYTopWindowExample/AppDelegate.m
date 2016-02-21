//
//  AppDelegate.m
//  LYTopWindowExample
//
//  Created by Y Liu on 16/2/21.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "AppDelegate.h"
#import "LYTopWindow.h"
#import "UIView+Extension.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[LYTopWindow sharedTopWindow] setClickStatusBarBlock:^{
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [self searchAllScrollViewsInView:window];
    }];
    
    return YES;
}

/**
 *  查找view中的所有scrollView
 */
- (void)searchAllScrollViewsInView:(UIView *)view {
    // 如果不在window矩形框里面，就直接返回
    // view和window没有重叠，就直接返回
    if (![view intersectWithView:nil]) return;
    
    for (UIView *subview in view.subviews) {
        [self searchAllScrollViewsInView:subview];
    }
    
    // 如果不是UIScrollView, 直接返回
    if (![view isKindOfClass:[UIScrollView class]]) return;
    
    UIScrollView *scrollView = (UIScrollView *)view;
    
    // 让scrollView滚动到最前面
    CGPoint offset = scrollView.contentOffset;
    offset.y = - scrollView.contentInset.top;
    [scrollView setContentOffset:offset animated:YES];
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