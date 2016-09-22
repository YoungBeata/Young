//
//  PhotoCell.h
//  Project01
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoScrollView;

@interface PhotoCell : UICollectionViewCell

@property(nonatomic,strong)PhotoScrollView *srollView;
@property(nonatomic,copy)NSString *url;

@end
