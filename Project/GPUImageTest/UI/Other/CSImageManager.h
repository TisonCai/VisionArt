//
//  CSImageManager.h
//  GPUImageTest
//
//  Created by caichaosen on 2017/10/10.
//  Copyright © 2017年 firesenge. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface CSImageManager : NSObject
+ (instancetype)shareManager;
- (void)getImageWithBlock:(void(^)(UIImage *image))imageBlock;
@end
