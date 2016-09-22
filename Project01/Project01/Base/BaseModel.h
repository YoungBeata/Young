//
//  BaseModel.h
//  Project01
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

-(id)initContentWithDic:(NSDictionary *)jsonDic;
-(void)setAttributes:(NSDictionary *)jsonDic;
-(NSDictionary *)attributeMapDic:(NSDictionary *)jsonDic;

@end
