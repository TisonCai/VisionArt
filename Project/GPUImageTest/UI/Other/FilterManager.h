//
//  FilterManager.h
//  GPUImageTest
//
//  Created by caichaosen on 2017/10/11.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPUImageFilter;

@interface FilterManager : NSObject
+ (instancetype)shareManager;
/** 缓存渲染 */
- (UIImage *)imageForFilter:(GPUImageFilter *)disFilter Image:(UIImage *)image;
/** 不缓存渲染 */
- (UIImage *)renderImageForFilter:(GPUImageFilter *)disFilter Image:(UIImage *)image;
@end
