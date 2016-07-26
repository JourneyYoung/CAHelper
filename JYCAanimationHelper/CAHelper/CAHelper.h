//
//  CAHelper.h
//  SixthDemo
//
//  Created by JourneyYoung on 16/7/25.
//  Copyright © 2016年 JourneyYoung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>



@interface CAHelper : NSObject



#pragma mark - 基本动画统一调用方法
+ (CABasicAnimation *)myBasicAnimationWithType:(NSString *)animationType
                                      duration:(CGFloat)duration
                                          from:(NSValue *)from
                                            to:(NSValue *)to
                                 autoRevereses:(BOOL)autoRevereses;

#pragma mark - 关键帧动画方法
#pragma mark 摇晃动画
+ (CAKeyframeAnimation *)myKeyShakeAnimationWithDuration:(CFTimeInterval)duration
                                                   angle:(CGFloat)angle
                                             repeatCount:(CGFloat)repeatCount;

#pragma mark 贝塞尔路径动画
+ (CAKeyframeAnimation *)myKeyPathAnimationWithDuration:(CFTimeInterval)duration
                                                   path:(UIBezierPath *)path;

#pragma mark 弹力仿真动画
+ (CAKeyframeAnimation *)myKeyBounceAnimationFrom:(CGPoint)from
                                               to:(CGPoint)to
                                         duration:(CFTimeInterval)duration;


@end
