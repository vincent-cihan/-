//
//  ScrollViewController.m
//  FreshMarket
//
//  Created by mac on 15/12/29.
//  Copyright © 2015年 vincent-leo. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configUI {
    _dataArray = [NSMutableArray array];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kSCREEN_WIDTH, kSCREEN_HEIGHT - 64)];
    _scrollView = scrollView;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    UIView *contentView = [[UIView alloc] initWithFrame:scrollView.bounds];
    _contentView = contentView;
    [_scrollView addSubview:contentView];
    kWS(ws);
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_scrollView);
        make.left.right.equalTo(ws.view);
    }];
    
}

#pragma mark - 下拉刷新，上拉加载更多
- (void)addMJRefreshIsHaveHeader:(BOOL)isHaveHeader andIsHaveFooter:(BOOL)isHaveFooter {
    if (isHaveHeader) {
//        // 1.加载所有的动画图片
//        NSMutableArray *images = [NSMutableArray array];
//        
//        for (int i = 1; i <= 6; i++) {
//            // 计算文件名
//            NSString *filename = [NSString stringWithFormat:@"shuaxin-%d.png", i];
//            // 加载图片
//            
//            // imageNamed: 有缓存(传入文件名)
//            //        UIImage *image =loadAnimation [UIImage imageNamed:filename];
//            
//            // imageWithContentsOfFile: 没有缓存(传入文件的全路径)
//            NSBundle *bundle = [NSBundle mainBundle];
//            NSString *path = [bundle pathForResource:filename ofType:nil];
//            UIImage *image = [UIImage imageWithContentsOfFile:path];
////            UIImage *newImage = [LYHControl imageWithImage:image scaledToSize:CGSizeMake(50, 50)];
//            // 添加图片到数组中
//            [images addObject:image];
//        }
        // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadData)];
//        // 设置普通状态的动画图片
//        [header setImages:images forState:MJRefreshStateIdle];
//        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
//        [header setImages:images forState:MJRefreshStatePulling];
//        // 设置正在刷新状态的动画图片
//        [header setImages:images forState:MJRefreshStateRefreshing];
//        // 隐藏时间
//        header.lastUpdatedTimeLabel.hidden = YES;
//        
//        // 隐藏状态
//        header.stateLabel.hidden = YES;
        _scrollView.mj_header = header;
        // 开始加载
//        [_scrollView.mj_header beginRefreshing];
    }
    if (isHaveFooter) {
        _scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    }
}

- (void)reloadData {
    DEBUGLOG_REWRITE_FUNC;
}

- (void)loadMore {
    DEBUGLOG_REWRITE_FUNC;
}

- (void)loadData {
    DEBUGLOG_REWRITE_FUNC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
