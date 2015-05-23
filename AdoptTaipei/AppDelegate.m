//
//  AppDelegate.m
//  AdoptTaipei
//
//  Created by Liyao on 2015/5/22.
//  Copyright (c) 2015年 Liyao. All rights reserved.
//

#import "AppDelegate.h"
#import "ATParse.h"
#import "ATAnimal.h"
#import "ATHelloViewController.h"

static NSString * const kDevConfig = @"devConfig";
static NSString * const kProConfig = @"proConfig";

@interface AppDelegate ()

@property (strong, nonatomic) UINavigationController *rootViewController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.rootViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
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
    [Parse setApplicationId:parse.applicationId clientKey:parse.clientKey];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    if([PFUser currentUser] == nil){
        [PFAnonymousUtils logInWithBlock:^(PFUser *user, NSError *error) {
            if (error) {
                NSLog(@"Anonymous login failed.");
            } else {
                NSLog(@"Anonymous user logged in.");
                [self _registAPNS];
            }
        }];
    }
    else{
        [self _registAPNS];
    }
    
    
    return YES;
}

- (void)_registAPNS
{
    UIApplication *application = [UIApplication sharedApplication];
    UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                    UIUserNotificationTypeBadge |
                                                    UIUserNotificationTypeSound);
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                             categories:nil];
    [application registerUserNotificationSettings:settings];
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    currentInstallation.channels = @[ @"global" ];
    [currentInstallation setObject:[PFUser currentUser].objectId forKey:@"userId"];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
//    [PFPush handlePush:userInfo];
    NSLog(@"%@", userInfo);
    NSDictionary *alert = userInfo[@"aps"][@"alert"];
    NSString *imageURL = alert[@"image"];
    NSString *words = alert[@"body"];
    
    ATHelloViewController *mvc = [[ATHelloViewController alloc] init];
    mvc.words = words;
    mvc.imageURL = imageURL;
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:mvc];
    [self.rootViewController presentViewController:nvc animated:YES completion:nil];
}

@end
