//
//  NewsViewController.m
//  Project01
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "NewsViewController.h"
#import "Common.h"
#import "NewsModel.h"
#import "NewsCell.h"
#import "UIImageView+WebCache.h"
#import "NewsDetailViewController.h"
#import "ImageViewController.h"

static CGFloat headerHeight = 215;
@interface NewsViewController (){

    UIImageView *_imgView;
    UILabel *_titleLable;
}

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    _tableView.backgroundColor = [UIColor clearColor];
    [self _createData];
    [self _createHeader];

}
-(void)_createData{
    NSArray *jsonArr = (NSArray *)[JsonField jsonField:@"news_list.json"];
    _data = [NSMutableArray array];
    
    for (NSDictionary *dic in jsonArr) {
        NewsModel *news = [[NewsModel alloc]init];
        
        news.newsId = [dic objectForKey:@"newsid"];
        news.type = [dic objectForKey:@"type"];
        news.title = [dic objectForKey:@"title"];
        news.summary = [dic objectForKey:@"summary"];
        news.image = [dic objectForKey:@"image"];
        [_data addObject:news];
    }
    [_tableView reloadData];
}
-(void)_createHeader{
    if (_data.count > 0) {
        NewsModel *news = _data[0];
    
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, headerHeight)];
        [_imgView sd_setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"pig"]];
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, headerHeight - 30 + 64,KScreenWidth, 30)];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.textColor = [UIColor whiteColor];
        _titleLable.backgroundColor = [UIColor colorWithWhite:0 alpha:.3];
        _titleLable.text = news.title;
        [self.view insertSubview:_imgView belowSubview:_tableView];
        [self.view insertSubview:_titleLable belowSubview:_tableView];
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = [scrollView contentOffset];
    if (offset.y > 0) {
        CGRect frame = _imgView.frame;
        frame.origin.y = -offset.y;
        _imgView.frame = frame;
    }else{
        CGRect frame = _imgView.frame;
        CGFloat height = headerHeight + ABS(offset.y);
        CGFloat width = height / headerHeight * KScreenWidth;
        
        frame = CGRectMake(-(width - KScreenWidth)/2, 64, width, height);
        _imgView.frame = frame;
        
    }
    _titleLable.bottom = _imgView.bottom;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifierHeader" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifierCell" forIndexPath:indexPath];
    cell.news = _data[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 279;
    }
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsModel *news = _data[indexPath.row];
    NSInteger type = [news.type integerValue];
    
    if (type == 0) {
        NewsDetailViewController *newsDetialController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetailViewController"];
        [newsDetialController setHidesBottomBarWhenPushed:YES];

        [self.navigationController pushViewController:newsDetialController animated:YES];
    }else if(type == 1){
        ImageViewController *imageController = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageViewController"];
        [imageController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:imageController animated:YES];
    }
    
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
