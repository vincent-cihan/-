//
//  CollectViewController.m
//  FreshMarket
//
//  Created by mac on 15/12/14.
//  Copyright © 2015年 vincent-leo. All rights reserved.
//

#import "CollectViewController.h"

@interface CollectViewController ()
{
    UIButton *_scrollToTopBtn;
}

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    _dataArray = [NSMutableArray array];
}

- (void)configUI {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_HEIGHT) collectionViewLayout:flowLayout];
    _collectionView = collectionView;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.emptyDataSetSource = self;
    _collectionView.emptyDataSetDelegate = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:_collectionView];
    
}

/**在子类中如果有MJRresh就不写loadData，没有就写*/
- (void)loadData {
    NSLog(@"子类需要重写%s", __FUNCTION__);
}

#pragma mark - 下拉刷新，上拉加载更多
- (void)addMJRefreshIsHaveHeader:(BOOL)isHaveHeader andIsHaveFooter:(BOOL)isHaveFooter {
    if (isHaveHeader) {
        // 1.加载所有的动画图片
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
        _collectionView.mj_header = header;
        // 开始加载
//        [_collectionView.mj_header beginRefreshing];
    }
    if (isHaveFooter) {
        _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    }
}

- (void)reloadData {
    NSLog(@"重新加载数据，子类需要重写%s", __FUNCTION__);
}

- (void)loadMore {
    NSLog(@"加载更多数据，子类需要重写%s", __FUNCTION__);
}

#pragma mark - collectionView 代理方法
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"子类需要重写%s", __FUNCTION__);
    return CGSizeMake(0, 0);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"子类需要重写%s", __FUNCTION__);
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"子类需要重写%s", __FUNCTION__);
    return nil;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    NSLog(@"子类需要重写%s", __FUNCTION__);
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - 置顶按钮
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == _collectionView) {
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
        if (_collectionView.contentOffset.y >= kSCREEN_HEIGHT / 2) {
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
    if (scrollView == _collectionView) {
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
        if (_collectionView.contentOffset.y >= kSCREEN_HEIGHT / 2) {
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
    if (_collectionView == scrollView) {
        _scrollToTopBtn.alpha = 0;
    }
}

- (void)scrollToTopBtnClick:(UIButton *)btn {
    [_collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
    _scrollToTopBtn.alpha = 0;
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
