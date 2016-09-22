//
//  MovieViewController.m
//  Project01
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieModel.h"
#import "MovieCell.h"
#import "PosterView.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self _createPosterView];
    [self _createdTableView];
    [self _createNavigationBarItem];
    [self _createData];
    
}
#pragma mark - loadData let data translated at movieModel
-(void)_createData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"us_box" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    _dataArray = [NSMutableArray array];
    NSArray *movieArray = jsonDic[@"subjects"];
    
    for (NSDictionary *dic in movieArray) {
        NSDictionary *subject = [dic objectForKey:@"subject"];
        MovieModel *movie = [[MovieModel alloc]init];
        movie.average = [[subject objectForKey:@"rating"]objectForKey:@"average"];
        movie.collect_count = [subject objectForKey:@"collect_count"];
        movie.title = [subject objectForKey:@"title"];
        movie.original_title = [subject objectForKey:@"original_title"];
        movie.subtype = [subject objectForKey:@"subtype"];
        movie.movieId = [subject objectForKey:@"id"];
        movie.images = [subject objectForKey:@"images"];
        movie.year = [subject objectForKey:@"year"];
        
        [_dataArray addObject:movie];
    }
    [_tableView reloadData];
    [_posterView setData:_dataArray];
}
#pragma mark - set TableView and PosterView
-(void)_createdTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-113) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    _tableView.dataSource = self;
    [_tableView setDelegate:self];
    _tableView.hidden = YES;
    _tableView.rowHeight = 120;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.separatorColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
}
-(void)_createPosterView{
    _posterView = [[PosterView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    _posterView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    _posterView.hidden = NO;
    [self.view addSubview:_posterView];
}
#pragma mark - make NavigationItem
-(void)_createNavigationBarItem{
    UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    UIButton *pButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pButton setImage:[UIImage imageNamed:@"poster_home@2x"] forState:UIControlStateNormal];
    [pButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    pButton.tag = 200;
    pButton.frame = buttonView.frame;
    pButton.hidden = NO;
    [pButton addTarget:self action:@selector(navigationBarItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:pButton];
    
    UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lButton setImage:[UIImage imageNamed:@"list_home@2x"] forState:UIControlStateNormal];
    [lButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    lButton.tag = 201;
    lButton.frame = buttonView.frame;
    lButton.hidden = YES;
    [lButton addTarget:self action:@selector(navigationBarItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:lButton];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:buttonView];
    self.navigationItem.rightBarButtonItem = right;

}
-(void)navigationBarItemAction:(UIBarButtonItem *)btnItem{
    UIView *buttonView = self.navigationItem.rightBarButtonItem.customView;
    
    UIButton *pButton = [buttonView viewWithTag:200];
    UIButton *lButton = [buttonView viewWithTag:201];
    pButton.hidden = !pButton.hidden;
    lButton.hidden = !lButton.hidden;
    [self flipView:buttonView flag:pButton.hidden];
    
    _tableView.hidden = !_tableView.hidden;
    _posterView.hidden = !_posterView.hidden;
    [self flipView:self.view flag:_posterView.hidden];
    
}

-(void)flipView:(UIView *)flipView flag:(BOOL)flag{
    UIViewAnimationOptions flip = flag ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;

    [UIView transitionWithView:flipView duration:.5 options:flip animations:^{
        [flipView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    } completion:NULL];
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identify = @"myCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MovieCell" owner:self options:nil]lastObject];
    }
    cell.movie = _dataArray[indexPath.row];
    return cell;
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
