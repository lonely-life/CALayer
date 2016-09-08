//
//  ViewController.m
//  01、CALayer的基本使用
//
//  Created by tens04 on 16/8/24.
//  Copyright © 2016年 tens. All rights reserved.
//

#import "ViewController.h"

/***
 通过下面传统上的创建UIView和CALayer这两个的创建和使用我们可以看出来其实CALayer无论是创建还是使用都和UIVIew比较相似，
 但是需要注意的是，UIVIew最后添加到的self.view 而CALayer最后添加到的是self.view.layer
 其次，CALayer在使用颜色设置、添加子视图等的时候都需要将其转换成VIew型的，不能直接添加
 ****/

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //这个是传统意义上的创建UIView
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 330, 200)];
    //设置VIew上的背景颜色
    view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view];
    
/*
 注意：
    以下的信息不是只有CALayer才能设置的，VIew上也可以自己直接设置，但是VIew其实还是基于CALayer上搭建起来的视图，只是这个视图层上是可以添加触发事件的
 **/
    //设置VIew上的layer的背景颜色，但是需要将其转换成VIew型的背景颜色
    view.layer.backgroundColor = [UIColor orangeColor].CGColor;
    
    //设置边框的宽度
    view.layer.borderWidth = 3;
    
    //设置边框颜色
    view.layer.borderColor = [UIColor blackColor].CGColor;
    //设置边框的倒角弧度
    view.layer.cornerRadius = 20;
    
    [self.view addSubview:view];
    
    
    // 1、创建layer
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(10, 320, 330, 200);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    // 2、将图层添加到父图层
    [self.view.layer addSublayer:layer];
    
    // 3、填充图片内容，需要将 UIImage 桥接(__bridge)到CGImage
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"image4.jpg"].CGImage);
    
    /*
      4、使用layer CATextLayer 子类填充文字
        CATextLayer是基于CALayer上的子类
     
     **/
    
    CATextLayer *textLayer = [[CATextLayer alloc] init];
    textLayer.frame = CGRectMake(10, 550, 300, 30);
    textLayer.string = @"这是layer填充的文字内容";
    
    //设置CATextLayer在没有显示字体之前的颜色
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    
    //设置CATextLayer 的背景颜色
    textLayer.backgroundColor = [UIColor redColor].CGColor;
    //设置显示的字体高度和需要开辟显示字体的宽度
    textLayer.font = (__bridge CFTypeRef _Nullable)([UIFont systemFontOfSize:20 weight:500]);
    //谁知显示的文字高度
    textLayer.fontSize = 20;
    
    //设置文字对齐方式
    textLayer.alignmentMode = @"center";
    // textLayer.truncationMode = @"middle";
    
    [self.view.layer addSublayer:textLayer];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
