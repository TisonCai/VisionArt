//
//  FilterOffer.m
//  GPUImageTest
//
//  Created by caichaosen on 2017/10/11.
//  Copyright © 2017年 firesenge. All rights reserved.
//

#import "FilterOffer.h"
#import "GPUImage.h"

@implementation FilterOffer
+ (NSArray *)VisualeffectFilters {
    GPUImageSketchFilter *ToonFilter1 = [GPUImageSketchFilter new];
    //阀值素描，形成有噪点的素描
    GPUImageThresholdSketchFilter *ToonFilter2 = [GPUImageThresholdSketchFilter new];
    //卡通效果（黑色粗线描边）
    GPUImageToonFilter *ToonFilter3 = [GPUImageToonFilter new];
    //相比上面的效果更细腻，上面是粗旷的画风
    GPUImageSmoothToonFilter *ToonFilter4 = [GPUImageSmoothToonFilter new];
    //桑原(Kuwahara)滤波,水粉画的模糊效果；处理时间比较长，慎用
    GPUImageKuwaharaFilter *ToonFilter5 = [GPUImageKuwaharaFilter new];
    //黑白马赛克
//    GPUImageMosaicFilter *ToonFilter6 = [GPUImageMosaicFilter new];
    //像素化
    GPUImagePixellateFilter *ToonFilter7= [GPUImagePixellateFilter new];
    //同心圆像素化
    GPUImagePolarPixellateFilter *ToonFilter8 = [GPUImagePolarPixellateFilter new];
    //交叉线阴影，形成黑白网状画面
    GPUImageCrosshatchFilter *ToonFilter9 = [GPUImageCrosshatchFilter new];
    //色彩丢失，模糊（类似监控摄像效果）
    GPUImageColorPackingFilter *ToonFilter10 = [GPUImageColorPackingFilter new];
    //晕影，形成黑色圆形边缘，突出中间图像的效果
    GPUImageVignetteFilter *ToonFilter11 = [GPUImageVignetteFilter new];
    //漩涡，中间形成卷曲的画面
    GPUImageSwirlFilter *ToonFilter12 = [GPUImageSwirlFilter new];
    //凸起失真，鱼眼效果
    GPUImageBulgeDistortionFilter *ToonFilter13 = [GPUImageBulgeDistortionFilter new];
    //收缩失真，凹面镜
    GPUImagePinchDistortionFilter *ToonFilter14 = [GPUImagePinchDistortionFilter new];
    //伸展失真，哈哈镜
    GPUImageStretchDistortionFilter *ToonFilter15 = [GPUImageStretchDistortionFilter new];
    //水晶球效果
    GPUImageGlassSphereFilter *ToonFilter16 = [GPUImageGlassSphereFilter new];
    //球形折射，图形倒立
    GPUImageSphereRefractionFilter *ToonFilter17 = [GPUImageSphereRefractionFilter new];
    //色调分离，形成噪点效果
    GPUImagePosterizeFilter *ToonFilter18 = [GPUImagePosterizeFilter new];
    //CGA色彩滤镜，形成黑、浅蓝、紫色块的画面
    GPUImageCGAColorspaceFilter *ToonFilter19 = [GPUImageCGAColorspaceFilter new];
    //柏林噪点，花边噪点
    GPUImagePerlinNoiseFilter *ToonFilter20 = [GPUImagePerlinNoiseFilter new];
    //3x3卷积，高亮大色块变黑，加亮边缘、线条等
    GPUImage3x3ConvolutionFilter *ToonFilter21 = [GPUImage3x3ConvolutionFilter new];
    //像素圆点花样
    GPUImagePolkaDotFilter *ToonFilter22 = [GPUImagePolkaDotFilter new];
    //浮雕效果，带有点3d的感觉
    GPUImageEmbossFilter *ToonFilter23 = [GPUImageEmbossFilter new];
    GPUImageHalftoneFilter *ToonFilter24 = [GPUImageHalftoneFilter new];
    NSArray *array = @[ToonFilter1,ToonFilter2,ToonFilter3,ToonFilter4,ToonFilter5,ToonFilter7,ToonFilter8,ToonFilter9,ToonFilter10,ToonFilter11,ToonFilter12,ToonFilter13,ToonFilter14,ToonFilter15,ToonFilter16,ToonFilter17,ToonFilter18,ToonFilter19,ToonFilter20,ToonFilter21,ToonFilter22,ToonFilter23,ToonFilter24];
    return array.copy;
}
+ (NSArray *)imageProcessing {
    //形状变化
    GPUImageTransformFilter *filter1 = [GPUImageTransformFilter new];
    //剪裁
    GPUImageCropFilter *filter2 = [GPUImageCropFilter new];
    //锐化
    GPUImageSharpenFilter *filter3 = [GPUImageSharpenFilter new];
    
    GPUImageUnsharpMaskFilter *filter4 = [GPUImageUnsharpMaskFilter new];
    GPUImageGaussianBlurFilter *filter5 = [GPUImageGaussianBlurFilter new];
    GPUImageGaussianSelectiveBlurFilter *filter6 = [GPUImageGaussianSelectiveBlurFilter new];
    GPUImageBoxBlurFilter *filter7 = [GPUImageBoxBlurFilter new];
    
//    69 #import ""
//    70
//    71 #import ""                  //模糊
//    72 #import ""              //高斯模糊
//    73 #import ""     //高斯模糊，选择部分清晰
//    74 #import ""                   //盒状模糊
//    75 #import "GPUImageTiltShiftFilter.h"                 //条纹模糊，中间清晰，上下两端模糊
//    76 #import "GPUImageMedianFilter.h"                    //中间值，有种稍微模糊边缘的效果
//    77 #import "GPUImageBilateralFilter.h"                 //双边模糊
//    78 #import "GPUImageErosionFilter.h"                   //侵蚀边缘模糊，变黑白
//    79 #import "GPUImageRGBErosionFilter.h"                //RGB侵蚀边缘模糊，有色彩
//    80 #import "GPUImageDilationFilter.h"                  //扩展边缘模糊，变黑白
//    81 #import "GPUImageRGBDilationFilter.h"               //RGB扩展边缘模糊，有色彩
//    82 #import "GPUImageOpeningFilter.h"                   //黑白色调模糊
//    83 #import "GPUImageRGBOpeningFilter.h"                //彩色模糊
//    84 #import "GPUImageClosingFilter.h"                   //黑白色调模糊，暗色会被提亮
//    85 #import "GPUImageRGBClosingFilter.h"                //彩色模糊，暗色会被提亮
//    86 #import "GPUImageLanczosResamplingFilter.h"         //Lanczos重取样，模糊效果
//    87 #import "GPUImageNonMaximumSuppressionFilter.h"     //非最大抑制，只显示亮度最高的像素，其他为黑
//    88 #import "GPUImageThresholdedNonMaximumSuppressionFilter.h" //与上相比，像素丢失更多
//    89
//    90 #import "GPUImageSobelEdgeDetectionFilter.h"        //Sobel边缘检测算法(白边，黑内容，有点漫画的反色效果)
//    91 #import "GPUImageCannyEdgeDetectionFilter.h"        //Canny边缘检测算法（比上更强烈的黑白对比度）
//    92 #import "GPUImageThresholdEdgeDetectionFilter.h"    //阈值边缘检测（效果与上差别不大）
//    93 #import "GPUImagePrewittEdgeDetectionFilter.h"      //普瑞维特(Prewitt)边缘检测(效果与Sobel差不多，貌似更平滑)
//    94 #import "GPUImageXYDerivativeFilter.h"              //XYDerivative边缘检测，画面以蓝色为主，绿色为边缘，带彩色
//    95 #import "GPUImageHarrisCornerDetectionFilter.h"     //Harris角点检测，会有绿色小十字显示在图片角点处
//    96 #import "GPUImageNobleCornerDetectionFilter.h"      //Noble角点检测，检测点更多
//    97 #import "GPUImageShiTomasiFeatureDetectionFilter.h" //ShiTomasi角点检测，与上差别不大
//    98 #import "GPUImageMotionDetector.h"                  //动作检测
//    99 #import "GPUImageHoughTransformLineDetector.h"      //线条检测
//    100 #import "GPUImageParallelCoordinateLineTransformFilter.h" //平行线检测
//    101
//    102 #import "GPUImageLocalBinaryPatternFilter.h"        //图像黑白化，并有大量噪点
//    103
//    104 #import "GPUImageLowPassFilter.h"                   //用于图像加亮
//    105 #import "GPUImageHighPassFilter.h"                  //图像低于某值时显示为黑
    return @[filter1,filter2,filter3,filter4,filter5,filter6,filter7];
}
+(NSArray *)blendPatry {
    //通常用于创建阴影和深度效果
    GPUImageMultiplyBlendFilter *filter1 = [GPUImageMultiplyBlendFilter new];
    //正常
    GPUImageNormalBlendFilter *filter2 = [GPUImageNormalBlendFilter new];
    //透明混合,通常用于在背景上应用前景的透明度
    GPUImageAlphaBlendFilter *filter3 = [GPUImageAlphaBlendFilter new];
    //溶解
    GPUImageDissolveBlendFilter *filter4 = [GPUImageDissolveBlendFilter new];
    //叠加,通常用于创建阴影效果
    GPUImageOverlayBlendFilter *filter5 = [GPUImageOverlayBlendFilter new];
    //加深混合,通常用于重叠类型
    GPUImageDarkenBlendFilter *filter6 = [GPUImageDarkenBlendFilter new];
    
//    147 #import "GPUImageLightenBlendFilter.h"              //减淡混合,通常用于重叠类型
//    148 #import "GPUImageSourceOverBlendFilter.h"           //源混合
//    149 #import "GPUImageColorBurnBlendFilter.h"            //色彩加深混合
//    150 #import "GPUImageColorDodgeBlendFilter.h"           //色彩减淡混合
//    151 #import "GPUImageScreenBlendFilter.h"               //屏幕包裹,通常用于创建亮点和镜头眩光
//    152 #import "GPUImageExclusionBlendFilter.h"            //排除混合
//    153 #import "GPUImageDifferenceBlendFilter.h"           //差异混合,通常用于创建更多变动的颜色
//    154 #import "GPUImageSubtractBlendFilter.h"             //差值混合,通常用于创建两个图像之间的动画变暗模糊效果
//    155 #import "GPUImageHardLightBlendFilter.h"            //强光混合,通常用于创建阴影效果
//    156 #import "GPUImageSoftLightBlendFilter.h"            //柔光混合
//    157 #import "GPUImageChromaKeyBlendFilter.h"            //色度键混合
//    158 #import "GPUImageMaskFilter.h"                      //遮罩混合
//    159 #import "GPUImageHazeFilter.h"                      //朦胧加暗
//    160 #import "GPUImageLuminanceThresholdFilter.h"        //亮度阈
//    161 #import "GPUImageAdaptiveThresholdFilter.h"         //自适应阈值
//    162 #import "GPUImageAddBlendFilter.h"                  //通常用于创建两个图像之间的动画变亮模糊效果
//    163 #import "GPUImageDivideBlendFilter.h"               //通常用于创建两个图像之间的动画变暗模糊效果
//    164
//    return @[filter1,filter2,filter3,filter4,filter5,filter6];
    return @[filter2];
}
@end
