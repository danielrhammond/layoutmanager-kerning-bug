//
//  BRAppDelegate.m
//  BoundingRectKernExperiment
//
//  Created by Daniel Hammond on 10/4/13.
//  Copyright (c) 2013 Daniel Hammond. All rights reserved.
//

#import "BRAppDelegate.h"
#import "BRRootViewController.h"

@implementation BRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [BRRootViewController new];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
