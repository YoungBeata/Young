//
//  TopViewController.m
//  Project01
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "TopViewController.h"
#import "MovieModel.h"
#import "TopCell.h"
#import "TopDetialViewController.h"
@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createData];
    _collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [self.view addSubview:_collectionView];
    // Do any additional setup after loading the view.
}
-(void)_createData{
    _data = [NSMutableArray array];
    NSDictionary *jsonDic = (NSDictionary *)[JsonField jsonField:@"top250.json"];
    NSArray *jsonArr = [jsonDic objectForKey:@"subjects"];
    
    for (NSDictionary *dic in jsonArr) {
        MovieModel *movie = [[MovieModel alloc]init];
        
        movie.images = [dic objectForKey:@"images"];
        movie.title = [dic objectForKey:@"title"];
        movie.average = [[dic objectForKey:@"rating"]objectForKey:@"average"];
        movie.original_title = [dic objectForKey:@"original_title"];
        movie.movieId = [dic objectForKey:@"id"];
        movie.year = [dic objectForKey:@"year"];
        movie.subtype = [dic objectForKey:@"subtype"];
        movie.collect_count = [dic objectForKey:@"collect_count"];
        
        [_data addObject:movie];
    }
    [_collectionView reloadData];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
//    if (!cell) {
//        cell = [[TopCell alloc]init];
//    }
    cell.movie = _data[indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    TopDetialViewController *topDetialCtr = [self.storyboard instantiateViewControllerWithIdentifier:@"TopDetialViewController"];
    [self.navigationController pushViewController:topDetialCtr animated:YES];
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
