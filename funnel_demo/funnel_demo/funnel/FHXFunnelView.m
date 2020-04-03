//
//  FHXFunnelView.m
//  funnel_demo
//
//  Created by hxxc on 2020/3/31.
//  Copyright © 2020 xjc. All rights reserved.
//

#import "FHXFunnelView.h"
#import "Masonry.h"
#import "UIColor+Extensions.h"
#import "UIButton+HXEnlargeTouchArea.h"

@implementation FHXFunnelView{
    
    FHXCustomButton * firstBtn;

    FHXCustomButton * secondBtn;

    FHXCustomButton * thirdBtn;

    FHXCustomButton * fourthBtn;
    
    UILabel * titleLabel;
    CGFloat registerCount;
    CGFloat openCount;
    CGFloat lendCount;
    CGFloat repeatCount;
    NSMutableArray * labelArray;
    NSMutableArray * imageViewArray;
}

//添加漏斗数据
-(void)setFunnelModel:(FHXFunnelModel *)funnelModel{
    
    //刷新数据隐藏显示button
    self.showButton.hidden = YES;
    
    if (funnelModel == nil) {
        //暂无数据
        self.noDataView.hidden = NO;
        return;
    }else{
        self.noDataView.hidden = YES;
    }
    
    _funnelModel = funnelModel;
    //数据整化
    registerCount = _funnelModel.firstItemNum.floatValue;
    openCount = _funnelModel.secondItemNum.floatValue;
    lendCount = _funnelModel.thirdItemNum.floatValue;
    repeatCount = _funnelModel.fourthItemNum.floatValue;
    
    //处理数据为0的情况
    if (registerCount == 0) {
        //暂无数据
        self.noDataView.hidden = NO;
        return;
    }else{
        self.noDataView.hidden = YES;
    }
    
    if (openCount == 0) {
        
        openCount = 1;
        lendCount = 1;
        repeatCount = 1;
    }
    if (lendCount == 0) {
        
        lendCount = 1;
        repeatCount = 1;
    }
    if (repeatCount == 0) {
        
        repeatCount = 1;
    }
    
    //注册
    firstBtn.frame = CGRectMake(32, 62, SCREEN_WIDTH - 32*2, 60);
    CGFloat baseProportion1 = openCount/registerCount;
    CGFloat leftProportion1 = (1 - baseProportion1)/2.0f;
    CGFloat rightProportion1 = 1 - leftProportion1;
    // 添加路径关键点array
    NSMutableArray *pointArray = [NSMutableArray array];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(0.f, 0.f))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(firstBtn), 0.f))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(firstBtn) *rightProportion1, firstBtn.frame.size.height))];
    [pointArray addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(firstBtn) *leftProportion1, kViewHeight(firstBtn)))];
    firstBtn.pointArray = [pointArray mutableCopy];
    firstBtn.backgroundColor = [UIColor colorWithHex:0x4162ff];
    [firstBtn setNeedsDisplay];
    
    
    //开户
    secondBtn.frame = CGRectMake(32, 62 + 60, kViewWidth(firstBtn) *baseProportion1, 60);
    [secondBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(firstBtn.mas_bottom).with.offset(kMidHeight);
        make.centerX.equalTo(firstBtn);
        make.width.equalTo(@(kViewWidth(firstBtn) * baseProportion1));
        make.height.equalTo(@60.f);
    }];
    
    CGFloat baseProportion2 = lendCount/openCount;
    CGFloat leftProportion2 = (1 - baseProportion2)/2.0f;
    CGFloat rightProportion2 = 1 - leftProportion2;
    // 添加路径关键点array
    NSMutableArray *pointArray1 = [NSMutableArray array];
    [pointArray1 addObject:NSStringFromCGPoint(CGPointMake(0.f, 0.f))];
    [pointArray1 addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(secondBtn), 0.f))];
    [pointArray1 addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(secondBtn) *rightProportion2, secondBtn.frame.size.height))];
    [pointArray1 addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(secondBtn) *leftProportion2, kViewHeight(secondBtn)))];
    secondBtn.pointArray = [pointArray1 mutableCopy];
    secondBtn.backgroundColor = [UIColor colorWithHex:0xffce66];
    [secondBtn setNeedsDisplay];
    
    //出借
    thirdBtn.frame = CGRectMake(32, 62 + 60, kViewWidth(secondBtn) * baseProportion2, 60);
    
    [thirdBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(secondBtn.mas_bottom).with.offset(kMidHeight);
        make.centerX.equalTo(secondBtn);
        make.width.equalTo(@(kViewWidth(secondBtn) * baseProportion2));
        make.height.equalTo(@60.f);
    }];
    
    CGFloat baseProportion3 = repeatCount/lendCount;
    CGFloat leftProportion3 = (1 - baseProportion3)/2.0f;
    CGFloat rightProportion3 = 1 - leftProportion3;
    // 添加路径关键点array
    NSMutableArray *pointArray2 = [NSMutableArray array];
    [pointArray2 addObject:NSStringFromCGPoint(CGPointMake(0.f, 0.f))];
    [pointArray2 addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(thirdBtn), 0.f))];
    [pointArray2 addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(thirdBtn) *rightProportion3, thirdBtn.frame.size.height))];
    [pointArray2 addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(thirdBtn) *leftProportion3, kViewHeight(thirdBtn)))];
    thirdBtn.pointArray = [pointArray2 mutableCopy];
    thirdBtn.backgroundColor = [UIColor colorWithHex:0xff6f6f];
    [thirdBtn setNeedsDisplay];
    
    //复投
    fourthBtn.frame = CGRectMake(32, 62 + 60, kViewWidth(thirdBtn) * baseProportion3, 60);
    [fourthBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(thirdBtn.mas_bottom).with.offset(kMidHeight);
        make.centerX.equalTo(thirdBtn);
        make.width.equalTo(@(kViewWidth(thirdBtn) * baseProportion3));
        make.height.equalTo(@60.f);
    }];
    
    // 添加路径关键点array
    NSMutableArray *pointArray3 = [NSMutableArray array];
    [pointArray3 addObject:NSStringFromCGPoint(CGPointMake(0.f, 0.f))];
    [pointArray3 addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(fourthBtn), 0.f))];
    [pointArray3 addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(fourthBtn) *1/2, fourthBtn.frame.size.height))];
    [pointArray3 addObject:NSStringFromCGPoint(CGPointMake(kViewWidth(fourthBtn) *1/2, kViewHeight(fourthBtn)))];
    fourthBtn.pointArray = [pointArray3 mutableCopy];
    fourthBtn.backgroundColor = [UIColor colorWithHex:0x8ea3ff];
    [fourthBtn setNeedsDisplay];
    
    //扩大button点击区域
    [firstBtn setTouchExpandEdgeWithTop:0 right:40 bottom:0 left:40];
    [secondBtn setTouchExpandEdgeWithTop:0 right:40 bottom:0 left:40];
    [thirdBtn setTouchExpandEdgeWithTop:0 right:40 bottom:0 left:40];
    [fourthBtn setTouchExpandEdgeWithTop:0 right:40 bottom:0 left:40];

}

//大标题
-(void)setTitle:(NSString *)title{
    
    _title = title;
    titleLabel.text = _title;
}

//小标题
-(void)setDesArray:(NSMutableArray *)desArray{
    
    _desArray = desArray;
    for (int i = 0; i < _desArray.count; i++) {
        //文字
        UILabel * label = labelArray[i];
        label.text = _desArray[i];
        //标识
        UIImageView * imageView = imageViewArray[i];
        if (i == 0) {
            [label mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                
                make.left.mas_equalTo(self).offset(32);
                make.bottom.mas_equalTo(self).offset(-15);
                make.width.equalTo(@25.0f);
                make.height.equalTo(@15.0f);
            }];
            
            [imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.left.equalTo(label);
                make.top.mas_equalTo(label.mas_bottom).offset(5);
                make.width.equalTo(@25.0f);
                make.height.equalTo(@5.0f);
            }];
        }else{
            
            UILabel * preLabel = labelArray[i - 1];
            [label mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.left.mas_equalTo(preLabel.mas_right).offset(14);
                make.centerY.equalTo(preLabel);
                make.width.equalTo(@25.0f);
                make.height.equalTo(@15.0f);
            }];
            
            [imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.left.equalTo(label);
                make.top.mas_equalTo(label.mas_bottom).offset(5);
                make.width.equalTo(@25.0f);
                make.height.equalTo(@5.0f);
            }];
        }
        
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //标题
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, frame.size.width, 40)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [self addSubview:titleLabel];
        
        //注册
        firstBtn = [FHXCustomButton buttonWithType:UIButtonTypeCustom];
        firstBtn.frame = CGRectMake(32, 62, SCREEN_WIDTH - 32*2, 60);
        firstBtn.layer.masksToBounds = YES;
        firstBtn.layer.cornerRadius = 5.0f;
        firstBtn.tag = 5001;
        [firstBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:firstBtn];

        //开户
        secondBtn = [FHXCustomButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:secondBtn];
        secondBtn.tag = 5002;
        [secondBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

        //出借
        thirdBtn = [FHXCustomButton buttonWithType:UIButtonTypeCustom];
        thirdBtn.frame = fourthBtn.frame;
        [self addSubview:thirdBtn];
        thirdBtn.tag = 5003;
        [thirdBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //复投
        fourthBtn = [FHXCustomButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:fourthBtn];
        fourthBtn.tag = 5004;
        [fourthBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //创建四个标识标签
        labelArray = [[NSMutableArray alloc]initWithCapacity:0];
        imageViewArray = [[NSMutableArray alloc]initWithCapacity:0];
        for (int i = 0; i < 4; i++) {
            UILabel * testLabel = [[UILabel alloc]init];
            testLabel.textColor = [UIColor colorWithHex:0x333333];
            testLabel.font = [UIFont systemFontOfSize:12];
            testLabel.textAlignment = NSTextAlignmentCenter;
            [labelArray addObject:testLabel];
            [self addSubview:testLabel];
            
            UIImageView * imageVIew = [[UIImageView alloc]init];
            imageVIew.layer.masksToBounds = YES;
            imageVIew.layer.cornerRadius = 2.5f;
            [imageViewArray addObject:imageVIew];
            [self addSubview:imageVIew];
            switch (i) {
                case 0:
                    imageVIew.backgroundColor = [UIColor colorWithHex:0x4262ff];
                    break;
                case 1:
                    imageVIew.backgroundColor = [UIColor colorWithHex:0xFFCE66];
                    break;
                case 2:
                    imageVIew.backgroundColor = [UIColor colorWithHex:0xFF6F6F];
                    break;
                case 3:
                    imageVIew.backgroundColor = [UIColor colorWithHex:0x8EA3FF];
                    break;
                    
                default:
                    break;
            }
        }
        
    }
    return self;
}

//点击效果
-(void)btnAction:(id)sender{
    
    self.showButton.hidden = NO;
    
    UIButton * btn = (UIButton *)sender;
    
    if (btn.tag == 5001) {
        
        [self.showButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.mas_equalTo(100 - firstBtn.center.x);
            make.centerY.equalTo(firstBtn);
            make.width.equalTo(@117.0f);
            make.height.equalTo(@43.0f);
        }];
        
        [self.showButton setBackgroundImage:[UIImage imageNamed:@"icon_message_register"] forState:UIControlStateNormal];
        [self.showButton setTitle:[NSString stringWithFormat:@"人数: %.0f",registerCount] forState:UIControlStateNormal];
    }
    
    if (btn.tag == 5002) {
        
        [self.showButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.mas_equalTo(100 - secondBtn.center.x);
            make.centerY.equalTo(secondBtn);
            make.width.equalTo(@115.0f);
            make.height.equalTo(@57.0f);
        }];
        [self.showButton setBackgroundImage:[UIImage imageNamed:@"icon_message_other"] forState:UIControlStateNormal];
        //转化率
        NSString * transRateStr = [[NSString stringWithFormat:@"%.2f",openCount/registerCount*100] stringByAppendingString:@"%"];
        [self.showButton setTitle:[NSString stringWithFormat:@"人数: %.0f\n转化率: %@",openCount,transRateStr] forState:UIControlStateNormal];
    }
    
    if (btn.tag == 5003) {
        
        [self.showButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.mas_equalTo(100 - thirdBtn.center.x);
            make.centerY.equalTo(thirdBtn);
            make.width.equalTo(@115.0f);
            make.height.equalTo(@57.0f);
        }];
        [self.showButton setBackgroundImage:[UIImage imageNamed:@"icon_message_other"] forState:UIControlStateNormal];
        //转化率
        NSString * transRateStr = [[NSString stringWithFormat:@"%.2f",lendCount/openCount*100] stringByAppendingString:@"%"];
        [self.showButton setTitle:[NSString stringWithFormat:@"人数: %.0f\n转化率: %@",lendCount,transRateStr] forState:UIControlStateNormal];
    }
    
    if (btn.tag == 5004) {
        
        [self.showButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.mas_equalTo(100 - fourthBtn.center.x);
            make.centerY.equalTo(fourthBtn);
            make.width.equalTo(@115.0f);
            make.height.equalTo(@57.0f);
        }];
        [self.showButton setBackgroundImage:[UIImage imageNamed:@"icon_message_other"] forState:UIControlStateNormal];
        //转化率
        NSString * transRateStr = [[NSString stringWithFormat:@"%.2f",repeatCount/lendCount*100] stringByAppendingString:@"%"];
        [self.showButton setTitle:[NSString stringWithFormat:@"人数: %.0f\n转化率: %@",repeatCount,transRateStr] forState:UIControlStateNormal];
    }
}

- (UIButton *)showButton{
    if (!_showButton) {
        
        _showButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _showButton.frame = CGRectMake(0, 0, 115, 57);
        [_showButton setTitleColor:[UIColor colorWithHex:666666] forState:UIControlStateNormal];
        _showButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _showButton.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        _showButton.titleLabel.lineBreakMode = 0;
        [self addSubview:_showButton];
        
    }
    return _showButton;
}

-(FHXChartNoDataView *)noDataView{
    
    if (!_noDataView) {
    
        _noDataView = [[NSBundle mainBundle]loadNibNamed:@"FHXChartNoDataView" owner:self options:nil][0];
        _noDataView.frame = self.bounds;
        [self addSubview:_noDataView];
        _noDataView.hidden = YES;
        [_noDataView mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self);
            make.centerY.equalTo(self);
            make.width.equalTo(@128.0f);
            make.height.equalTo(@128.0f);
        }];
        
    }
    return _noDataView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
