//
//  PhotoCollectionView.m
//  Project01
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCell.h"

@implementation PhotoCollectionView
-(instancetype)initWithFrame:(CGRect)frame{
    //collectionView必须要有布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置滑动的方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //布局对象的尺寸
    flowLayout.itemSize = CGSizeMake(KScreenWidth, KScreenHeight);
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        //设置当前对象的代理对象
        self.delegate = self;
        self.dataSource = self;
        self.pagingEnabled = YES;
        flowLayout.minimumLineSpacing = 0;
        
        //注册单元格
        [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"cell"];
        
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _urls.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.url = _urls[indexPath.row];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
