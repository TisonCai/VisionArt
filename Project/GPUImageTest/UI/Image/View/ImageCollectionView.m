//
//  ImageCollectionView.m
//  GPUImageTest
//
//  Created by caichaosen on 2017/9/30.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import "ImageCollectionView.h"
#import "FilterManager.h"
#import <objc/runtime.h>

static NSString *kImageCell = @"ImageCell";

@interface ImageCell ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ImageCell
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _imageView = [UIImageView new];
    _imageView.frame = self.contentView.bounds;
    [self.contentView addSubview:_imageView];
    
    return self;
}

@end


@interface ImageCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSArray *filters;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ImageCollectionView
-(instancetype)initWithImage:(UIImage *)image Filters:(NSArray *)filters {
    self = [super init];
    if (!self)  return nil;
    
    _image = image;
    _filters = filters;
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    size = CGSizeMake(size.width, size.height-64-44);
    
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(size.height*0.2, size.height*0.2);
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 5;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    _collectionView.collectionViewLayout = flowLayout;
    [_collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:kImageCell];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.frame = self.bounds;
    
    [self addSubview:_collectionView];
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    CGSize size = [UIScreen mainScreen].bounds.size;
    [_collectionView setFrame:CGRectMake(0, 0, size.width, (size.height-64-44)*0.2)];

}
#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.filters.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCell forIndexPath:indexPath];
    
    cell.imageView.image = [[FilterManager shareManager] imageForFilter:self.filters[indexPath.item] Image:_image];
    
    return cell;
}
#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didClickImage) {
        _didClickImage(self.filters[indexPath.item],[self cellImageForIndexPath:indexPath]);
    }
}
#pragma mark - private
- (UIImage *)cellImageForIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = (ImageCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    return cell.imageView.image;
}
@end
