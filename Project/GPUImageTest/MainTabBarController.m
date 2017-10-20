//
//  MainTabBarController.m
//  GPUImageTest
//
//  Created by caichaosen on 2017/9/30.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import "MainTabBarController.h"
#import "CSImageViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addControllerWithControllerName:@"CSImageViewController" Title:@"图像" Image:[UIImage imageNamed:@"图像管理"]];
    [self addControllerWithControllerName:@"CSVideoViewController" Title:@"视频" Image:[UIImage imageNamed:@"视频-2"]];
}
- (void)addControllerWithControllerName:(NSString *)controllerName Title:(NSString *)title Image:(UIImage *)image {
    Class class = NSClassFromString(controllerName);
    
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:image tag:0];
    id controller = [class new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    navigationController.tabBarItem = item;
    [self addChildViewController:navigationController];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
