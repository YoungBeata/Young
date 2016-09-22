//
//  MainTabBarController.m
//  Project01
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "MainTabBarController.h"
#import "TabBarItem.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all@2x"]];
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64@2x"] forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self _createTabBar];
}
-(void)_createTabBar{
   
    for (UIView *view in self.tabBar.subviews) {
//        NSLog(@"subview = %@",self.tabBar.subviews);
        
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            [view removeFromSuperview];
        }
        NSArray *imgArr = @[@"movie_home@2x",@"msg_new@2x",@"start_top250@2x",@"icon_cinema@2x",@"more_setting@2x"];
        NSArray *titleArr = @[@"电影",@"新闻",@"top250",@"影院",@"更多"];
        
        
        CGFloat buttonWidth = KScreenWidth / imgArr.count;
        
        if (_selectedView == nil) {
            _selectedView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 49)];
            _selectedView.image = [UIImage imageNamed:@"selectTabbar_bg_all1@2x"];
            [self.tabBar addSubview:_selectedView];
        }
        
        for (int i = 0; i < imgArr.count; i++) {
            NSString *imageName = imgArr[i];
            NSString *title = titleArr[i];
        
            //建立新的item
            CGRect fram = CGRectMake(i * buttonWidth, 0, buttonWidth, self.tabBar.bounds.size.height);
            TabBarItem *item = [[TabBarItem alloc]initWithFrame:fram imageName:imageName title:title];
            [self.tabBar addSubview:item];
            item.tag = 100 + i;
            
            [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i == 0) {
                _selectedView.center = item.center;
            }
        }
    }
}

-(void)itemAction:(TabBarItem *)item{
    self.selectedIndex = item.tag - 100;
    [UIView animateWithDuration:.2 animations:^{
        _selectedView.center = item.center;
    }];

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
