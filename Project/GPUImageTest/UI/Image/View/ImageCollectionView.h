//
//  ImageCollectionView.h
//  GPUImageTest
//
//  Created by caichaosen on 2017/9/30.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPUImageFilter;
@interface ImageCell : UICollectionViewCell

@end

@interface ImageCollectionView : UIView
// 回调滤镜出去，搞个专门的滤镜处理类
@property (nonatomic, copy) void(^didClickImage)(GPUImageFilter *filter,UIImage *image);
- (instancetype)initWithImage:(UIImage *)image Filters:(NSArray *)filters;
- (void)setImage:(UIImage *)image;
@end
