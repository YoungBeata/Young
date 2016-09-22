//
//  TopDetialViewController.m
//  Project01
//
//  Created by admin on 16/9/21.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "TopDetialViewController.h"
#import "TopDetial.h"
#import "TopDetialCell.h"

@interface TopDetialViewController ()

@end

@implementation TopDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    [self _createData];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

-(void)_createData{
    NSDictionary *topDic = (NSDictionary *)[JsonField jsonField:@"movie_detail.json"];
    
    NSDictionary *commentDic = (NSDictionary *)[JsonField jsonField:@"movie_comment.json"];
    NSArray *commentArr = commentDic[@"list"];
    _dataArr = [NSMutableArray array];
    for (NSDictionary *dic in commentArr) {
        _topDetial = [[TopDetial alloc]init];
        _topDetial.userImage = dic[@"userImage"];
        _topDetial.nickName = dic[@"nickname"];
        _topDetial.rating = dic[@"rating"];
        _topDetial.userContent = dic[@"content"];
        
        [_dataArr addObject:_topDetial];
    }
    _topDetial.topImage = topDic[@"image"];
    _topDetial.titleCn = topDic[@"titleCn"];
    _topDetial.titleEn = topDic[@"titleEn"];
    _topDetial.content = topDic[@"content"];
    _topDetial.images = topDic[@"images"];
    [_tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count + 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        TopDetialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopCell" forIndexPath:indexPath];
        UIImageView *imgView = [tableView viewWithTag:200];
        
        
        [imgView sd_setImageWithURL:[NSURL URLWithString:_topDetial.topImage]placeholderImage:[UIImage imageNamed:@"pig"]];
        
//        imgView.image=[UIImage imageNamed:@"pig"];
        UILabel *titleCn = [tableView viewWithTag:201];
        NSLog(@"%@",titleCn);
        titleCn.text = _topDetial.titleCn;
        UILabel *titleEn = [tableView viewWithTag:202];
        titleEn.text = _topDetial.titleEn;
        UITextView *textView = [tableView viewWithTag:203];
        textView.text = _topDetial.content;
        
        NSLog(@"------------------------aaaaaaaa");
        
        return cell;
    }else if(indexPath.row == 1){
        NSLog(@"------------------------aaaaaaaa");
        TopDetialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
        NSLog(@"------------------------aaaaaaaa");
        UIImageView *imageView1 = [tableView viewWithTag:300];
        NSLog(@"%@",imageView1);
        [imageView1 sd_setImageWithURL:[NSURL URLWithString:_topDetial.images[0]]];
        UIImageView *imageView2 = [tableView viewWithTag:301];
        [imageView2 sd_setImageWithURL:[NSURL URLWithString:_topDetial.images[1]]];
        UIImageView *imageView3 = [tableView viewWithTag:302];
        [imageView3 sd_setImageWithURL:[NSURL URLWithString:_topDetial.images[2]]];
        UIImageView *imageView4 = [tableView viewWithTag:303];
        [imageView4 sd_setImageWithURL:[NSURL URLWithString:_topDetial.images[3]]];
     
        return cell;
    }else{
        TopDetialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopDetialCell" forIndexPath:indexPath];
        cell.topDetial = _dataArr[indexPath.row - 2];
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 180;
    }else if (indexPath.row == 1){
        return 85;
    }else if([self.index isEqual:indexPath]){
        TopDetial *top = self.dataArr[indexPath.row - 2];
        NSString *text = top.userContent;
        
        CGRect rect = [text boundingRectWithSize:CGSizeMake(266, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]} context:nil];
        return rect.size.height + 57;
    }else{
        return 76;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (![_index isEqual:indexPath]) {
        self.index = indexPath;
        [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
