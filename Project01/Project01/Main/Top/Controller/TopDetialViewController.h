//
//  TopDetialViewController.h
//  Project01
//
//  Created by admin on 16/9/21.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "BaseViewController.h"
@class TopDetial;

@interface TopDetialViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)TopDetial *topDetial;
@property(nonatomic,copy)NSMutableArray *dataArr;
@property(nonatomic,strong)NSIndexPath *index;

@end
