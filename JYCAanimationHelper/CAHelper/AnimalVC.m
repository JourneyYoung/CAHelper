//
//  AnimalVC.m
//  SixthDemo
//
//  Created by JourneyYoung on 16/7/24.
//  Copyright © 2016年 JourneyYoung. All rights reserved.
//

#import "AnimalVC.h"
#import "CAHelper.h"



@interface AnimalVC ()

@property(nonatomic,strong)UIImageView *imageview;

@property(nonatomic,strong)UIView *circle;

@end

@implementation AnimalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(10, 100, 100, 100)];
    self.imageview.image = [UIImage imageNamed:@"1.png"];
    [self.view addSubview:self.imageview];
    
    self.circle = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    self.circle.layer.cornerRadius = 25;
    self.circle.layer.masksToBounds = YES;
    self.circle.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.circle];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, 300, [UIScreen mainScreen].bounds.size.width-40, 30)];
    [self.view addSubview:btn];
    [btn setTitle:@"开始动画" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(beginAnimalion) forControlEvents:UIControlEventTouchUpInside];
    
}


-(void)beginAnimalion
{
    // 1. 定义动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    // 定义一组动画
    // 淡入淡出动画
    CABasicAnimation *alpha = [CAHelper myBasicAnimationWithType:@"opacity" duration:1.0 from:@(1.0) to:@(0.3) autoRevereses:YES];
    // 旋转动画
    CABasicAnimation *rotation = [CAHelper myBasicAnimationWithType:@"transform.rotation" duration:1.0 from:@(-M_PI) to:@(2*M_PI) autoRevereses:NO];
    // 缩放动画
    CABasicAnimation *scale = [CAHelper myBasicAnimationWithType:@"transform.scale" duration:0.5 from:@(1.0) to:@(0.1) autoRevereses:YES];

    // 平移动画
    NSValue *v = [NSValue valueWithCGPoint:self.imageview.layer.position];
    CGPoint toPoint = self.imageview.layer.position;
    toPoint.x += 180;
    NSValue *tov = [NSValue valueWithCGPoint:toPoint];
    CABasicAnimation *animalmove = [CAHelper myBasicAnimationWithType:@"position" duration:1.0 from:v to:tov autoRevereses:YES];
    
    
    // 2. 设置动画组属性
    [group setAnimations:@[alpha, animalmove, rotation, scale]];
    
    // 设置动画的时长
    [group setDuration:3.0];
    
    // 3. 将动画组添加到图层
    [_imageview.layer addAnimation:group forKey:nil];
    
    
    
    // 关键帧路径动画，弹力仿真动画效果
    CGPoint location = CGPointMake(125, 300);
    CAKeyframeAnimation *path = [self test1:_circle.center to:location];
    [_circle.layer addAnimation:path forKey:nil];

}


- (CAKeyframeAnimation *)test1:(CGPoint)from to:(CGPoint)to
{
    CAKeyframeAnimation *anim = [CAHelper myKeyBounceAnimationFrom:from to:to duration:1.5];
    [anim setFillMode:kCAFillModeForwards];
    [anim setRemovedOnCompletion:NO];
    
    [anim setDelegate:self];
    
    return anim;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
