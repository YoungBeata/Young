//
//  MovieViewController.h
//  Project01
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "BaseViewController.h"
@class PosterView;
@interface MovieViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
    PosterView *_posterView;
    
    NSMutableArray *_dataArray;
}

@end
