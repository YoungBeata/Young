//
//  TopDetialCell.h
//  Project01
//
//  Created by admin on 16/9/21.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopDetial;

@interface TopDetialCell : UITableViewCell

@property(nonatomic,strong)TopDetial *topDetial;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *commentary;

@end
