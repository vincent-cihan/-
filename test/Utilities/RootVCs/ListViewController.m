//
//  ListViewController.m
//  FreshMarket
//
//  Created by mac on 15/12/5.
//  Copyright © 2015年 vincent-leo. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()
{
    UIButton *_scrollToTopBtn;
}

@end

@implementation ListViewController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (_tableView.mj_header) {
        [_tableView.mj_header endRefreshing];
    }
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (_tableView.mj_header) {
        [_tableView.mj_header endRefreshing];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self configUI];
    _dataArray = [NSMutableArray array];
    // Do any additional setup after loading the view.
}

- (void)configUI {
    UIView *noneView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 0, 0)];
    [self.view addSubview:noneView];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kSCREEN_WIDTH, kSCREEN_HEIGHT - 64) style:UITableViewStylePlain];

    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.emptyDataSetSource = self;
    _tableView.emptyDataSetDelegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

/**在子类中如果有MJRresh就不写loadData，没有就写*/
- (void)loadData {
    DEBUGLOG_REWRITE_FUNC;
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
////            UIImage *newImage = [LYHControl imageWithImage:image scaledToSize:CGSizeMake(44.75, 54)];
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
        // 隐藏时间
//        header.lastUpdatedTimeLabel.hidden = YES;
        
        // 隐藏状态
//        header.stateLabel.hidden = YES;
        _tableView.mj_header = header;
        // 开始加载
//        [_tableView.mj_header beginRefreshing];
    }
    if (isHaveFooter) {
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    }
}

- (void)reloadData {
    DEBUGLOG_REWRITE_FUNC;
}

- (void)loadMore {
    DEBUGLOG_REWRITE_FUNC;
}

#pragma mark - tableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    DEBUGLOG_REWRITE_FUNC;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DEBUGLOG_REWRITE_FUNC;[@"1" isEqualToString:@"1"];
    return nil;
}

#pragma mark - 置顶按钮
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == _tableView) {
        if (!_scrollToTopBtn) {
            UIButton *scrollToTopBtn = [LYHUIControl buttonWithTitle:nil font:nil target:self action:@selector(scrollToTopBtnClick:)];
            _scrollToTopBtn = scrollToTopBtn;
            //TODO: 置顶按钮
            [scrollToTopBtn setImage:[UIImage imageNamed:@"home_zhiding"] forState:UIControlStateNormal];
//            [self.view addSubview:scrollToTopBtn];
//            [self.view bringSubviewToFront:scrollToTopBtn];
            [scrollToTopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.view).offset(-60);
                make.right.equalTo(self.view).offset(-10);
                make.size.mas_equalTo(CGSizeMake(33, 33));
            }];
        }
        if (_tableView.contentOffset.y >= kSCREEN_HEIGHT / 2) {
            [UIView animateWithDuration:1 animations:^{
                _scrollToTopBtn.alpha = 1;
            }];
        } else {
            [UIView animateWithDuration:1 animations:^{
                _scrollToTopBtn.alpha = 0;
            }];
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView == _tableView) {
        if (!_scrollToTopBtn) {
            UIButton *scrollToTopBtn = [LYHUIControl buttonWithTitle:nil font:nil target:self action:@selector(scrollToTopBtnClick:)];
            _scrollToTopBtn = scrollToTopBtn;
            //TODO: 置顶按钮
            [scrollToTopBtn setImage:[UIImage imageNamed:@"home_zhiding"] forState:UIControlStateNormal];
//            [self.view addSubview:scrollToTopBtn];
//            [self.view bringSubviewToFront:scrollToTopBtn];
            [scrollToTopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.view).offset(-70);
                make.right.equalTo(self.view).offset(-10);
                make.size.mas_equalTo(CGSizeMake(33, 33));
            }];
        }
        if (_tableView.contentOffset.y >= kSCREEN_HEIGHT / 2) {
            [UIView animateWithDuration:1 animations:^{
                _scrollToTopBtn.alpha = 1;
            }];
        } else {
            [UIView animateWithDuration:1 animations:^{
                _scrollToTopBtn.alpha = 0;
            }];
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _scrollToTopBtn.alpha = 0;
}

- (void)scrollToTopBtnClick:(UIButton *)btn {
    [_tableView setContentOffset:CGPointMake(0, 0) animated:YES];
    _scrollToTopBtn.alpha = 0;
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return kWHITE_COLOR;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
