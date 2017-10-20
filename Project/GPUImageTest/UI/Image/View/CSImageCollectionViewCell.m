//
//  CSImageCollectionViewCell.m
//  GPUImageTest
//
//  Created by caichaosen on 2017/10/10.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import "CSImageCollectionViewCell.h"

@interface CSImageCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CSImageCollectionViewCell
+ (UINib *)nib {
    return [UINib nibWithNibName:NSStringFromClass(CSImageCollectionViewCell.class) bundle:nil];
}
-(void)setContentImage:(UIImage *)contentImage {
    _contentImage = contentImage;
    self.imageView.image = contentImage;
}
- (IBAction)didClickSelectButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    if ([self.delegate respondsToSelector:@selector(didSelectImage:)]) {
        [_delegate didSelectImage:self.imageView.image];
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
