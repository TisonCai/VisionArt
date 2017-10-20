//
//  CSImageManager.m
//  GPUImageTest
//
//  Created by caichaosen on 2017/10/10.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import "CSImageManager.h"
#import <Photos/Photos.h>

@interface CSImageManager ()

@property (nonatomic, strong) PHCachingImageManager *imageManager;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) NSMutableArray *assetArray;
@end

@implementation CSImageManager
+ (instancetype)shareManager {
    static CSImageManager *manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [CSImageManager new];
    });
    return manager;
}
- (void)getImageWithBlock:(void(^)(UIImage *image))imageBlock {

    [self.assetArray removeAllObjects];
    PHFetchResult *result = [PHAsset fetchAssetsWithOptions:nil];
    [result enumerateObjectsUsingBlock:^(PHAsset *asset, NSUInteger idx, BOOL * _Nonnull stop) {
        if (asset) {
            [self.assetArray addObject:asset];
        }
    }];
    for (PHAsset *asset in self.assetArray) {
        [self.imageManager requestImageDataForAsset:asset options:nil resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
            UIImage *image = [UIImage imageWithData:imageData];
            if (image) {
                if (imageBlock) {
                    imageBlock(image);
                }
            }
        }];
    }
}
#pragma mark - getter
-(NSMutableArray *)imageArray {
    if (!_imageArray) {
        _imageArray = @[].mutableCopy;
    }
    return _imageArray;
}
-(PHCachingImageManager *)imageManager {
    if (!_imageManager) {
        _imageManager = [PHCachingImageManager new];
    }
    return _imageManager;
}
-(NSMutableArray *)assetArray {
    if (!_assetArray) {
        _assetArray = @[].mutableCopy;
    }
    return _assetArray;
}
@end
