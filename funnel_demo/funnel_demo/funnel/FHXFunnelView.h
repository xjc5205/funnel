//
//  FHXFunnelView.h
//  funnel_demo
//
//  Created by hxxc on 2020/3/31.
//  Copyright © 2020 xjc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHXCustomButton.h"
#import "FHXFunnelModel.h"
#import "FHXChartNoDataView.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define kViewWidth(View) CGRectGetWidth(View.frame)
#define kViewHeight(View) CGRectGetHeight(View.frame)
#define kMidHeight 3.0f

NS_ASSUME_NONNULL_BEGIN

@interface FHXFunnelView : UIView

/*标题*/
@property(nonatomic,strong)NSString * title;
/*小标题*/
@property(nonatomic,strong)NSMutableArray * desArray;
/*数据*/
@property(nonatomic,strong)FHXFunnelModel * funnelModel;

/*点击展示文案*/
@property(nonatomic,strong)UIButton * showButton;
/*无数据*/
@property(nonatomic,strong)FHXChartNoDataView * noDataView;
@end

NS_ASSUME_NONNULL_END
