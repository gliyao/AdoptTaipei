//
//  AppDelegate.m
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/22.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "AppDelegate.h"
#import "ATParse.h"

static NSString * const kDevConfig = @"devConfig";
static NSString * const kProConfig = @"proConfig";

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifdef DEBUG
    NSString *configFile = kDevConfig;
#else
    NSString *configFile = kProConfig;
#endif
    
    NSError *e = nil;
    ATParse *parse = [[ATParse alloc] initWithDictionary:[NSDictionary dictionaryWithJSONFile:configFile] error:&e];
    
    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:parse.applicationId clientKey:parse.clientKey];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    if([PFUser currentUser] == nil){
        [PFAnonymousUtils logInInBackground];
    }
    return YES;
}


@end
