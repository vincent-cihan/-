//
//  ScrollViewController.h
//  FreshMarket
//
//  Created by mac on 15/12/29.
//  Copyright © 2015年 vincent-leo. All rights reserved.
//

#import "RootViewController.h"
#import "HttpManager.h"
#import "MJRefresh.h"

@interface ScrollViewController : RootViewController <UIScrollViewDelegate>
{
    __weak UIScrollView *_scrollView;
    NSMutableArray *_dataArray;
    __weak UIView *_contentView;
}

/**布局界面*/
- (void)configUI;
/**加载数据*/
- (void)loadData;

- (void)addMJRefreshIsHaveHeader:(BOOL)isHaveHeader andIsHaveFooter:(BOOL)isHaveFooter;
- (void)reloadData;
- (void)loadMore;

@end
