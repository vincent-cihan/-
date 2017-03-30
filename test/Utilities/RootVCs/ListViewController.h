//
//  ListViewController.h
//  FreshMarket
//
//  Created by mac on 15/12/5.
//  Copyright © 2015年 vincent-leo. All rights reserved.
//

#import "RootViewController.h"
#import "MJRefresh.h"
#import "HttpManager.h"
#import "UIScrollView+EmptyDataSet.h"

@interface ListViewController : RootViewController<UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
{
    __weak UITableView *_tableView;
    NSMutableArray *_dataArray;
    
}

/**布局界面*/
- (void)configUI;
/**加载数据*/
- (void)loadData;

/**是否有上下拉刷新*/
- (void)addMJRefreshIsHaveHeader:(BOOL)isHaveHeader andIsHaveFooter:(BOOL)isHaveFooter;
- (void)loadMore;
- (void)reloadData;

@end    
