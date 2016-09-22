//
//  MoreViewController.m
//  Project01
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()<UIAlertViewDelegate>



@end
@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.backgroundColor = [UIColor  colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self countSize];
}

-(void)countSize{
    NSInteger fliedSize = [[SDImageCache sharedImageCache]getSize];
    _countLabel.text = [NSString stringWithFormat:@"%.1fM",fliedSize/1024/1024.0];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"清理缓存" message:@"确定要清理我吗......" delegate:self cancelButtonTitle:@"宝宝不要了" otherButtonTitles:@"就要就要就要", nil];
        
        [alertView show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [[SDImageCache sharedImageCache]clearDisk];
        [self countSize];
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
