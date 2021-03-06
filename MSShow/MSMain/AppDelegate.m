//
//  AppDelegate.m
//  MSShow
//
//  Created by mr.scorpion on 16/8/22.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 3D Touch
    [self configure3DTouch];
    
    return YES;
}

- (void)configure3DTouch
{
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fx_3DTouch_AdorableStar"];
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fx_3DTouch_Search_brand"];
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fx_3DTouch_Receipt_of_goods"];
    UIApplicationShortcutIcon *icon4 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fx_3DTouch_Star_Ticket"];
    
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.51fanxing.adorableStar" localizedTitle:@"萌星说" localizedSubtitle:nil icon:icon1 userInfo:nil];
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.51fanxing.searchBrand" localizedTitle:@"搜品牌" localizedSubtitle:nil icon:icon2 userInfo:nil];
    UIMutableApplicationShortcutItem *item3 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.51fanxing.receiptOfGoods" localizedTitle:@"查物流" localizedSubtitle:nil icon:icon3 userInfo:nil];
    UIMutableApplicationShortcutItem *item4 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.51fanxing.starTicket" localizedTitle:@"摇星券" localizedSubtitle:nil icon:icon4 userInfo:nil];
    
    NSArray *items = @[item1, item2, item3,item4];
    NSArray *existingItems = [UIApplication sharedApplication].shortcutItems;
    NSArray *updatedItems = [existingItems arrayByAddingObjectsFromArray:items];
    [UIApplication sharedApplication].shortcutItems = updatedItems;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler
{
    // 判断先前我们设置的唯一标识
    if([shortcutItem.type isEqualToString:@"com.51fanxing.adorableStar"]) {
        NSLog(@"adorableStar");
    }
    else if ([shortcutItem.type isEqualToString:@"com.51fanxing.searchBrand"]) {
        NSLog(@"searchBrand");
    }
    else if ([shortcutItem.type isEqualToString:@"com.51fanxing.receiptOfGoods"]) {
        NSLog(@"receiptOfGoods");
    }
    else if ([shortcutItem.type isEqualToString:@"com.51fanxing.starTicket"]){
        NSLog(@"starTicket");
    }
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
