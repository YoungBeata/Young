//
//  TopViewController.h
//  Project01
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "BaseViewController.h"

@interface TopViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    NSMutableArray *_data;
    
    __weak IBOutlet UICollectionView *_collectionView;
    
}
@end
