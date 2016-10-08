//
//  AppDelegate.m
//  Quartz2D
//
//  Created by moxuyou on 16/10/5.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//当应用程序启动完毕时调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
    //创建控制器有三种方法
    //1,代码创建控制器,但是控制器的view是从XIB文件中加载的
    ViewController *vc1 = [[ViewController alloc] initWithNibName:@"test" bundle:[NSBundle mainBundle]];
    self.window.rootViewController = vc1;
    [self.window makeKeyAndVisible];
    
    //2,纯代码创建控制器和控制器的view(init的底层会调用initWithNibName:方法,这个经常会导致一些奇怪的bug,例如,名字跟控制器的类名只差controller时,明明有了xib并且关联了,却报错说没有关联类,原因是你创建的xib原本是做普通的view来用的,系统却把他当做控制器的view来加载,所以才会报错)
    ViewController *vc2 = [[ViewController alloc] init];
    self.window.rootViewController = vc2;
    [self.window makeKeyAndVisible];
    //3.storyboard中加载控制器和控制器的view
    UIStoryboard *storyB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc3 = [storyB instantiateInitialViewController];
    self.window.rootViewController = vc3;
     
     //想要用xib来去描述控制器的View必须得要做两件事
     //1.绑定类.告诉xib去描述哪一个控制器的Veiw
     //2.连线.告诉控制器xib当中的哪一个View去描述控制器的View
     
     //loadView默认做法
     //1.查看当前控制器是否是从storyBoard当中加载,如果是,就从storyBoard中创建View
     //2.如果不是storyBoard,当前控制器的view有没有xib来描述.如果有,就会加载xib当中创建的View.
     //3.如果也没有xib描述控制器的view,它就会通过[[UIView alloc] init]创建一个空的view赋值给self.view;
     
     //只要重写了loadView,就说明控制器的View要自己去创建
     */
    
    //1.获取对象
    UIApplication *app = [UIApplication sharedApplication];
    
    //注册用户通知
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    
    [app registerUserNotificationSettings:setting];
    
    //提醒数字
    app.applicationIconBadgeNumber = 1;
    //设置联网状态
    //app.networkActivityIndicatorVisible = YES;
    //跟其他平台进行交互
    //NSURL *url = [NSURL URLWithString:@"http://www.520it.com"];
    //[app openURL:url];
    //让运用程序管理状态栏(默认是控制器管理的,如果想要转换管理者,得去info里面更改View controller-based status bar appearance配置为YES)
    app.statusBarStyle = UIStatusBarStyleLightContent;//只有这个模式和默认的模式
    //让状态栏隐藏
    app.statusBarHidden = YES;
    //在ios9当中,如果有多个窗口, 控制器会自动隐藏状态栏
    //在后面ios10就不会出现这种情况.
    //2.设置窗口的根控制器
    
    return YES;
}

//状态栏样式(UIApplication的一个方法)
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    
//    return UIStatusBarStyleLightContent;
//}
//当应用程序将要失去焦点时调用  (失去焦点:当前程序能不能与用户进行交互)
- (void)applicationWillResignActive:(UIApplication *)application {
    
}

//当应用程序进入到后台时调用
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

//当应用程序即将进入到前台时调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

//当应用程序获取焦点时调用
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

//当应用程序即将终止时调用
- (void)applicationWillTerminate:(UIApplication *)application {
    
}

//当收到内存警告时调用
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    //清理缓存
    
}
@end
