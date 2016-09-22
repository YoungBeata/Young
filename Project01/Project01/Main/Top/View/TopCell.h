//
//  TopCell.h
//  Project01
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"
#import "MovieModel.h"

@interface TopCell : UICollectionViewCell{

    __weak IBOutlet UIImageView *_imgView;
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet StarView *_starView;
    __weak IBOutlet UILabel *_ratingLabel;
}
@property(nonatomic,strong)MovieModel *movie;
@end
