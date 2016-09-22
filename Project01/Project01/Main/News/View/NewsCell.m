
//
//  NewsCell.m
//  Project01
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"
#import "UIImageView+WebCache.h"

@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setNews:(NewsModel *)news{
    if (news != nil) {
        _news = news;
        _summaryLabel.transform = CGAffineTransformIdentity;
        NSString *urlString = self.news.image;
        NSURL *url = [NSURL URLWithString:urlString];
        [_imgView sd_setImageWithURL:url];
        _titleLabel.text = self.news.title;
        _titleLabel.textColor = [UIColor yellowColor];
        _summaryLabel.text = self.news.summary;
        _summaryLabel.textColor = [UIColor orangeColor];
        NSInteger type = [self.news.type integerValue];
        if (type == 0) {
            CGRect f1 = _iconImage.frame;
            CGRect f2 = _summaryLabel.frame;
            
            CGFloat x = f1.origin.x - f2.origin.x;
            
            _iconImage.hidden = YES;
            _summaryLabel.transform = CGAffineTransformMakeTranslation(x, 0);
        }else if (type == 1){
            _iconImage.image = [UIImage imageNamed:@"sctpxw@2x"];
            _iconImage.hidden = NO;
        }else{
            _iconImage.image = [UIImage imageNamed:@"scspxw@2x"];
            _iconImage.hidden = NO;
        }
        
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
