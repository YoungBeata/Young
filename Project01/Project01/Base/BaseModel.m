//
//  BaseModel.m
//  Project01
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
-(id)initContentWithDic:(NSDictionary *)jsonDic{
    self = [super init];
    if (self) {
        [self setAttributes:jsonDic];
    }
    return self;
}
-(void)setAttributes:(NSDictionary *)jsonDic{
    NSDictionary *mapDic = [self attributeMapDic:jsonDic];
    for (NSString *jsonKey in mapDic) {
        NSString *modelArr = [mapDic objectForKey:@"jsonKey"];
        SEL selector = [self stringToSel:modelArr];
        if ([self respondsToSelector:selector]) {
            id value = [jsonDic objectForKey:jsonKey];
            if ([value isKindOfClass:[NSNull class]]) {
                value = @"";
            }
            [self performSelector:selector withObject:value];
        }
    }

}
-(SEL)stringToSel:(NSString *)attName{
    NSString *first = [[attName substringToIndex:1]uppercaseString];
    NSString *end = [attName substringFromIndex:1];
    NSString *setMethod = [NSString stringWithFormat:@"set%@%@",first,end];
    
    return NSSelectorFromString(setMethod);

}

-(NSDictionary *)attributeMapDic:(NSDictionary *)jsonDic{
    NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];
    for (id key in jsonDic) {
        [mapDic setValue:key forKey:key];
    }
    return mapDic;
}
@end
