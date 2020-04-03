//
//  ViewController.m
//  funnel_demo
//
//  Created by hxxc on 2020/3/31.
//  Copyright © 2020 xjc. All rights reserved.
//

#import "ViewController.h"
#import "FHXFunnelView.h"
#import "FHXFunnelModel.h"

@interface ViewController ()
@property(nonatomic,strong)FHXFunnelView * funnelView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1];
    
    _funnelView = [[FHXFunnelView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 360)];
    [self.view addSubview:self.funnelView];
    
    [self initTestData];
    
    UIButton * refreshBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    refreshBtn.frame = CGRectMake(0, 0, 100, 44);
    refreshBtn.center = CGPointMake(self.view.center.x, self.view.center.y + 30);
    [refreshBtn setTitle:@"刷 新" forState:UIControlStateNormal];
    [refreshBtn addTarget:self action:@selector(initTestData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:refreshBtn];
}

-(void)initTestData{
    
    //动态添加数据
    FHXFunnelModel * funnelModel = [[FHXFunnelModel alloc]init];
    funnelModel.firstItemNum = [NSString stringWithFormat:@"%d",(arc4random() % 100) + 300];
    funnelModel.secondItemNum = [NSString stringWithFormat:@"%d",(arc4random() % 100) + 200];
    funnelModel.thirdItemNum = [NSString stringWithFormat:@"%d",(arc4random() % 100) + 100];
    funnelModel.fourthItemNum = [NSString stringWithFormat:@"%d",(arc4random() % 100) + 0];
    self.funnelView.funnelModel = funnelModel;
    
    //大标题
    self.funnelView.title = @"用户数据漏斗图";
    
    //小标题
    NSArray * array = @[@"注册",@"开户",@"绑卡",@"下单"];
    NSMutableArray * titleArray = [NSMutableArray arrayWithArray:array];
    self.funnelView.desArray = titleArray;
    NSLog(@"%@\n%@\n%@\n%@",funnelModel.firstItemNum,funnelModel.secondItemNum,funnelModel.thirdItemNum,funnelModel.fourthItemNum);
}

@end
