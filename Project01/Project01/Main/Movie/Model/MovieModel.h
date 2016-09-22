//
//  MovieModel.h
//  Project01
//
//  Created by admin on 16/8/26.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject

@property(nonatomic,strong)NSNumber *average;
@property(nonatomic,copy)NSString *year;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *subtype;
@property(nonatomic,copy)NSString *original_title;
@property(nonatomic,copy)NSString *movieId;
@property(nonatomic,copy)NSDictionary *images;
@property(nonatomic,strong)NSNumber *collect_count;

@end
