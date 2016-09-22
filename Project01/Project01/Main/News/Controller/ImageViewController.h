//
//  ImageViewController.h
//  Project01
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{

    __weak IBOutlet UICollectionView *_collectionView;

}

@property(nonatomic,strong)NSMutableArray *data;

@end
