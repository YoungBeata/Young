//
//  NewsCell.h
//  Project01
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModel;

@interface NewsCell : UITableViewCell{

    __weak IBOutlet UIImageView *_imgView;
    __weak IBOutlet UILabel *_titleLabel;
    
    __weak IBOutlet UIImageView *_iconImage;
    __weak IBOutlet UILabel *_summaryLabel;
}

@property(nonatomic,strong)NewsModel *news;
@end
