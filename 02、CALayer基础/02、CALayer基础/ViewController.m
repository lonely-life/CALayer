//
//  ViewController.m
//  02、CALayer基础
//
//  Created by kinglinfu on 16/8/24.
//  Copyright © 2016年 Tens. All rights reserved.
//

#import "ViewController.h"
/*
 这个主要是用来掩饰CALayer的基本使用方法和其最基本的一些使用标准以及语法，从线面我们就可以看出来，其实最基本CALayer的使用还是非常简单的
 **/

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    // layer.frame = CGRectMake(0, 100, 350, 200);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    
    
    // 1、bounds： 尺寸
    layer.bounds = CGRectMake(0, 0, 200, 200);
    // 2、position: 定位点
    layer.position = self.view.center;
    
    // 3、锚点、支点：决定layer上的哪个点在 position 点上，默认(0.5, 0.5)，范围：（0，0） ~ （1，1）
    layer.anchorPoint = CGPointMake(0.5, 0.5);
    
    // 4、z方向的层级
    layer.zPosition = 2;
    
    // 5、设置圆角：cornerRadius
    layer.cornerRadius = 100;
    /**
    6、填充内容
     (__bridge id _Nullable)，这个是用来将UIVIew中的一些控件转换为CALayer中可以使用的关键代码
     layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"image6.jpg"].CGImage);
    **/
    layer.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"imageView0.jpeg"]].CGColor;
    
    // 7、是否可以裁剪多余的图层
    // layer.masksToBounds = YES;
    
    // 8、设置边框宽度和颜色
    layer.borderWidth = 5;
    layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    // 9、设置阴影: 尺寸、颜色、透明度、圆角
    layer.shadowOffset = CGSizeMake(10, 5);
    layer.shadowColor = [UIColor redColor].CGColor;
    layer.shadowOpacity = 0.5;
    layer.shadowRadius = 10;
    
    [self.view.layer addSublayer:layer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
