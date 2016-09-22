//
//  ImageViewController.m
//  Project01
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ImageViewController.h"
#import "NewsModel.h"
#import "PhotoViewController.h"
#import "WXNavigationController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新闻图片";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    _collectionView.backgroundColor = [UIColor clearColor];
    [self _createData];
}
-(void)_createData{
    NSArray *jsonArr = (NSArray *)[JsonField jsonField:@"image_list.json"];
    _data = [NSMutableArray array];
    for (NSDictionary *dic in jsonArr) {
        NewsModel *news = [[NewsModel alloc]init];
        
        news.newsId = dic[@"id"];
        news.type = dic[@"type"];
        news.image = dic[@"image"];
        
        [_data addObject:news];
    }
    [_collectionView reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifierCollectionCell" forIndexPath:indexPath];
    UIImageView *imgView = (UIImageView *)[cell.contentView viewWithTag:101];
    NewsModel *news = _data[indexPath.row];
    [imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",news.image]] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    return cell;
}
//-(void)viewWillDisappear:(BOOL)animated{
//    self.tabBarController.tabBar.hidden = NO;
//}
//-(void)viewWillAppear:(BOOL)animated{
//    self.tabBarController.tabBar.hidden = YES;
//}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoViewController *photoController = [[PhotoViewController alloc]init];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NewsModel *news in _data) {
        NSString *url = news.image;
        [arr addObject:url];
    }
    photoController.urls = arr;
    photoController.indexPath = indexPath;
    WXNavigationController *naviagation = [[WXNavigationController alloc]initWithRootViewController:photoController];
    
    [self presentViewController:naviagation animated:YES completion:NULL];

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
