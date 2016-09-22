//
//  PhotoViewController.m
//  Project01
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionView.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
//    self.navigationController.navigationBar.translucent = YES;
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    _isHiden = NO;
    [navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    navigationBar.barStyle = UIBarStyleBlack;
    navigationBar.translucent = YES;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(itemAction:)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    PhotoCollectionView *collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    [self.view addSubview:collectionView];
    collectionView.urls = _urls;
    
    [collectionView scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tap:) name:@"lalala" object:nil];
        
}
-(void)tap:(NSNotification *)noti{
    _isHiden = !_isHiden;
//    [self.navigationController.navigationBar setHidden:_isHiden];
    [self.navigationController setNavigationBarHidden:_isHiden];
//    self.navigationController.navigationBar.hidden = _isHiden;
}
-(BOOL)prefersStatusBarHidden{
    return _isHiden;
}
-(void)itemAction:(UIBarButtonItem *)item{
    [self dismissViewControllerAnimated:YES completion:NULL];
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
