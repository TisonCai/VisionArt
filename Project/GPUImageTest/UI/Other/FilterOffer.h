//
//  FilterOffer.h
//  GPUImageTest
//
//  Created by caichaosen on 2017/10/11.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilterOffer : NSObject
/**
 视觉效果
 */
+ (NSArray *)VisualeffectFilters;
/** 图像处理 */
+ (NSArray *)imageProcessing;
/** 混合模式 */
+ (NSArray *)blendPatry;
@end
