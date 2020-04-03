//
//  FHXCustomButton.m
//  funnel_demo
//
//  Created by hxxc on 2020/3/31.
//  Copyright © 2020 xjc. All rights reserved.
//

#import "FHXCustomButton.h"


@interface FHXCustomButton()

@property (nonatomic, strong) UIBezierPath * path;

@end
@implementation FHXCustomButton

// pointArray
- (void)setPointArray:(NSMutableArray *)pointArray
{
    _pointArray = pointArray;
}

// 绘制图形时添加path遮罩
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.fillColor = [UIColor redColor].CGColor;
    self.layer.mask = shapLayer;
    
    //获取四个点
    CGPoint point0 = CGPointFromString(_pointArray[0]);
    CGPoint point1 = CGPointFromString(_pointArray[1]);
    CGPoint point2 = CGPointFromString(_pointArray[2]);
    CGPoint point3 = CGPointFromString(_pointArray[3]);
    
    //构造fromPath
    UIBezierPath * fromPath = [UIBezierPath bezierPath];
    [fromPath moveToPoint:point0];
    [fromPath addLineToPoint:point0];//起始的path也必须是一个矩形，不然动画效果会有区别
    [fromPath addLineToPoint:point1];
    [fromPath addLineToPoint:point1];//同上
    shapLayer.path = fromPath.CGPath;
    
    //构造toPath(最终图形样式)
    UIBezierPath * toPath = [UIBezierPath bezierPath];
    [toPath moveToPoint:point0];
    [toPath addLineToPoint:point3];
    [toPath addLineToPoint:point2];
    [toPath addLineToPoint:point1];
    [toPath closePath];
    
    // 构造动画
    CABasicAnimation * animation = [CABasicAnimation animation];
    animation.keyPath = @"path";
    animation.duration = 1;
    animation.fromValue = (id)fromPath.CGPath;
    shapLayer.path = (__bridge CGPathRef _Nullable)((id)toPath.CGPath);
    [shapLayer addAnimation:animation forKey:nil];

}


// 点击的覆盖方法，点击时判断点是否在path内，YES则响应，NO则不响应
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL res = [super pointInside:point withEvent:event];
    if (res)
    {
        if ([self.path containsPoint:point])
        {
            return YES;
        }
        return NO;
    }
    return NO;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
