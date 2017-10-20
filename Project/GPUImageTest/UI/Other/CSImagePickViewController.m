//
//  CSImagePickViewController.m
//  GPUImageTest
//
//  Created by caichaosen on 2017/10/10.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import "CSImagePickViewController.h"
#import "CSImageCollectionViewCell.h"

static NSString *const CSImageCollectionViewCellID = @"CSImageCollectionViewCell.h";

@interface CSImagePickViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,CSImageCollectionViewCellDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation CSImagePickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat size = (width-5*4)/3;
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.itemSize = CGSizeMake(size,size);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [collectionView registerNib:[CSImageCollectionViewCell nib] forCellWithReuseIdentifier:CSImageCollectionViewCellID];
    _collectionView = collectionView;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 40, 40)];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
}
- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CSImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CSImageCollectionViewCellID forIndexPath:indexPath];
    cell.contentImage = self.dataSource[indexPath.item];
    cell.delegate = self;
    return cell;
}
#pragma mark - CSImageCollectionViewCellDelegate
-(void)didSelectImage:(UIImage *)image {
    if (self.didSelectImageBlock) {
        _didSelectImageBlock(image);
    }
    [self dismiss];
}
-(void)setDataSource:(NSMutableArray *)dataSource {
    _dataSource = dataSource;
    [_collectionView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
