//
//  UIButton+HXEnlargeTouchArea.m
//  huaxiafinance_user_app_3.0
//
//  Created by hxxc on 2017/10/31.
//  Copyright © 2017年 xjc. All rights reserved.
//

#import "UIButton+HXEnlargeTouchArea.h"
#import <objc/runtime.h>
@implementation UIButton (HXEnlargeTouchArea)

static char topRegion;
static char rightRegion;
static char bottomRegion;
static char leftRegion;

- (void)setTouchExpandEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left {
    objc_setAssociatedObject(self, &topRegion, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightRegion, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomRegion, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftRegion, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)expandRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topRegion);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightRegion);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomRegion);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftRegion);
    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,self.bounds.origin.y - topEdge.floatValue,self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect rect = [self expandRect];
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}


@end
