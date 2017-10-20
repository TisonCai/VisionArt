//
//  CSImageCollectionViewCell.h
//  GPUImageTest
//
//  Created by caichaosen on 2017/10/10.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CSImageCollectionViewCellDelegate <NSObject>
- (void)didSelectImage:(UIImage *)image;
@end

@interface CSImageCollectionViewCell : UICollectionViewCell
@property (nonatomic, weak) id<CSImageCollectionViewCellDelegate> delegate;
@property (nonatomic, strong) UIImage *contentImage;
+ (UINib *)nib;
@end
