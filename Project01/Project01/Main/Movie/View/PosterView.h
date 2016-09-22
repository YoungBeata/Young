//
//  PosterView.h
//  Project01
//
//  Created by admin on 16/8/31.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PosterCollectionView;
@class IndexCollectionView;
@interface PosterView : UIView{
    //头部视图
    UIView *_headerView;
    //大海报视图
    PosterCollectionView *_posterCollectionView;
    //小海报视图
    IndexCollectionView *_indexCollectionView;
    //尾部视图
    UILabel *_footerLabel;
}

@property(nonatomic,strong)NSMutableArray *data;

@end
