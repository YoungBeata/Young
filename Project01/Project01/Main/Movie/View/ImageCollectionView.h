//
//  ImageCollectionView.h
//  Project01
//
//  Created by admin on 16/9/9.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,assign)CGFloat pageWidth;
@property(nonatomic,strong)NSMutableArray  *data;
@property(nonatomic,assign)NSInteger currentItem;

@end
