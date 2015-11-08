//
//  AppDelegate.m
//  Sure
//
//  Created by Akoo on 15/11/5.
//  Copyright (c) 2015年 Akoo. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tb = [[UITabBarController alloc] init];
     self.window.rootViewController= tb;
    
    MainViewController * mainCtrl = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    //mainCtrl.view.backgroundColor=[UIColor greenColor];

    UINavigationController * nav  = [[UINavigationController alloc] initWithRootViewController:mainCtrl];
    nav.navigationBarHidden = YES;
    nav.tabBarItem.title=@"首页";
    nav.tabBarItem.image=[UIImage imageNamed:@"set"];
    
    FirstViewController * firstCtrl = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    //firstCtrl.view.backgroundColor=[UIColor greenColor];
    
    UINavigationController * nav1  = [[UINavigationController alloc] initWithRootViewController:firstCtrl];
    nav1.navigationBarHidden = YES;
    nav1.tabBarItem.title=@"明细";
    nav1.tabBarItem.image=[UIImage imageNamed:@"set"];
    
    SecondViewController * secondtCtrl = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    //secondtCtrl.view.backgroundColor=[UIColor greenColor];
    
    UINavigationController * nav2  = [[UINavigationController alloc] initWithRootViewController:secondtCtrl];
    nav2.navigationBarHidden = YES;
    nav2.tabBarItem.title=@"钱包";
    nav2.tabBarItem.image=[UIImage imageNamed:@"set"];
    
    ThirdViewController * thirdCtrl = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
   // thirdCtrl.view.backgroundColor=[UIColor greenColor];
    
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:thirdCtrl];
    nav3.navigationBarHidden = YES;
    nav3.tabBarItem.title=@"未定";
    nav3.tabBarItem.image=[UIImage imageNamed:@"set"];
    
    FourthViewController * fourthCtrl = [[FourthViewController alloc] initWithNibName:@"FourthViewController" bundle:nil];
   // fourthCtrl.view.backgroundColor=[UIColor greenColor];
    
    UINavigationController * nav4  = [[UINavigationController alloc] initWithRootViewController:fourthCtrl];
    nav4.navigationBarHidden = YES;
    nav4.tabBarItem.title=@"更多...";
    nav4.tabBarItem.image=[UIImage imageNamed:@"set"];
  
    tb.viewControllers=@[nav,nav1,nav2,nav3,nav4];//zi kongzhiqi
   
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
