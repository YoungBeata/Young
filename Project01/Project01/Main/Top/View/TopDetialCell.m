//
//  TopDetialCell.m
//  Project01
//
//  Created by admin on 16/9/21.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "TopDetialCell.h"
#import "TopDetial.h"

@implementation TopDetialCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_topDetial.userImage]];
    
    _nickName.text = _topDetial.nickName;
    _rating.text = _topDetial.rating;
    _commentary.text = _topDetial.userContent;
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
