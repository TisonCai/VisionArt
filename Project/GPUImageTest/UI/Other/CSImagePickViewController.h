//
//  CSImagePickViewController.h
//  GPUImageTest
//
//  Created by caichaosen on 2017/10/10.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSImagePickViewController : UIViewController
@property (nonatomic, copy) void(^didSelectImageBlock)(UIImage *);
@property (nonatomic, strong) NSMutableArray *dataSource;
@end
