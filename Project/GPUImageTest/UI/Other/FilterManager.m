//
//  FilterManager.m
//  GPUImageTest
//
//  Created by caichaosen on 2017/10/11.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import "FilterManager.h"
#import "GPUImage.h"
#import "GPUImageFilter.h"
#import <UIKit/UIKit.h>

@interface FilterManager ()
@property (nonatomic, strong) NSMutableDictionary *imageCache;
@end

@implementation FilterManager
-(instancetype)init {
    self = [super init];
    _imageCache = @{}.mutableCopy;
    return self;
}
+ (instancetype)shareManager {
    static FilterManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [FilterManager new];
    });
    return manager;
}
#pragma mark - Private
- (UIImage *)imageForFilter:(GPUImageFilter *)disFilter Image:(UIImage *)image{
    
    NSString *filterName = NSStringFromClass(disFilter.class);
    UIImage *newImage = self.imageCache[filterName];
    if (!newImage) {
        newImage = [self _filterForImage:image Filter:disFilter];
        self.imageCache[filterName] = newImage;
    }
    return newImage;
}
- (UIImage *)renderImageForFilter:(GPUImageFilter *)disFilter Image:(UIImage *)image {
    return [self _filterForImage:image Filter:disFilter];
}
- (UIImage *)_filterForImage:(UIImage *)image Filter:(GPUImageFilter *)filter {
    //设置要渲染的区域
    [filter forceProcessingAtSizeRespectingAspectRatio:image.size];
    [filter useNextFrameForImageCapture];
    
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:image];
    
    //添加上滤镜
    [stillImageSource addTarget:filter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    return [filter imageFromCurrentFramebuffer];
}
@end
