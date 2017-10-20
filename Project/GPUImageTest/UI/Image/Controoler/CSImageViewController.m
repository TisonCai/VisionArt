//
//  ViewController.m
//  GPUImageTest
//
//  Created by caichaosen on 2017/9/30.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import "CSImageViewController.h"
#import "CSImagePickViewController.h"

#import "ImageCollectionView.h"
#import "FilterOffer.h"
#import "PopoverView.h"
#import "CSImageManager.h"
#import "FilterManager.h"

#import <Photos/Photos.h>

#define weakSelf(weakSelf) __weak typeof(self) weakSelf = self
#define strongSelf(strongSelf) __strong typeof(weakSelf) strongSelf = weakSelf

@interface CSImageViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) ImageCollectionView *filterView;
@end

@implementation CSImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageArray = @[].mutableCopy;
    [self getAlbum];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat height = size.height-64-44;
    
    UIImage *image = [UIImage imageNamed:@"滤镜2"];
    _imageView = [[UIImageView alloc] initWithImage:image];
    _imageView.frame = CGRectMake(0, 64, size.width, height*0.8);
    _imageView.userInteractionEnabled = YES;
    [self gestureForCustomView:_imageView];
    [self.view addSubview:_imageView];
    
    ImageCollectionView *collectionView = [[ImageCollectionView alloc] initWithImage:image Filters:[FilterOffer VisualeffectFilters]];
    _filterView = collectionView;
    collectionView.frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame), size.width, height*0.2);
    
    weakSelf(weakSelf);
    [collectionView setDidClickImage:^(GPUImageFilter *filter,UIImage *image) {
        strongSelf(strongSelf);
        if (!_image) {
            strongSelf.imageView.image = image;
        } else {
            strongSelf.imageView.image = [[FilterManager shareManager] renderImageForFilter:filter Image:_image];
        }
    }];
    [self.view addSubview:collectionView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(didClickImage) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 40, 40)];
    [button setBackgroundImage:[UIImage imageNamed:@"add-2"] forState:UIControlStateNormal];
    _button = button;
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithCustomView:button];
    
}
- (void)didClickImage {
    PopoverView *popView = [PopoverView popoverView];
    popView.style = PopoverViewStyleDark;
    [popView showToView:_button withActions:[self imageAction]];
}
- (NSArray *)imageAction {
    weakSelf(weakSelf);
    PopoverAction *albumAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"相册"] title:@"相册" handler:^(PopoverAction *action) {
        
        
        CSImagePickViewController *imageVC = [CSImagePickViewController new];
        [imageVC setDidSelectImageBlock:^(UIImage *image) {
            weakSelf.imageView.image = image;
            weakSelf.image = image;
        }];
        UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:imageVC];
        imageVC.dataSource = self.imageArray;
        [self presentViewController:navigationVC animated:YES completion:nil];

    }];
    PopoverAction *photoAction = [PopoverAction actionWithImage:[UIImage imageNamed:@"拍照"] title:@"拍照" handler:^(PopoverAction *action) {
        
    }];
    return @[albumAction,photoAction];
}
- (void)gestureForCustomView:(UIView *)view {
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(didLongGestureImageView)];
    [view addGestureRecognizer:longGesture];
}
- (void)didLongGestureImageView {
    if (self.presentedViewController) return;
    UIAlertController *alertController = [[UIAlertController alloc] init];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:saveAction];
    [alertController addAction:cancleAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
#pragma mark - touch
- (void)getAlbum {
    
    weakSelf(weakSelf);
    [[CSImageManager shareManager] getImageWithBlock:^(UIImage *image) {
        strongSelf(strongSelf);
        [strongSelf.imageArray addObject:image];
        NSLog(@"%@",strongSelf.imageArray);
    }];
}

@end
