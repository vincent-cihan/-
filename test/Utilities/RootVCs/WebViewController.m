//
//  WebViewController.m
//  JTXX
//
//  Created by Mac on 16/7/25.
//  Copyright © 2016年 nanjingfeisheng. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
{
    UIButton *_scrollToTopBtn;
}

@end

@implementation WebViewController

- (void)dealloc {
    _webView.scrollView.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
//    _url = @"http://www.baidu.com";
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, kSCREEN_WIDTH, kSCREEN_HEIGHT - 64 - kTarbarHeight)];
    _webView = webView;
    
    [self.view addSubview:webView];
    _webView.navigationDelegate = self;
    _webView.UIDelegate = self;
//    _webView.delegate = self ;
    _webView.scrollView.delegate = self;
//    _webView.scalesPageToFit = YES;
    
    [self addMJRefreshHeader];
    
}

#pragma mark - 下拉刷新
- (void)addMJRefreshHeader {
//    // 1.加载所有的动画图片
//    NSMutableArray *images = [NSMutableArray array];
//    
//    for (int i = 1; i <= 6; i++) {
//        // 计算文件名
//        NSString *filename = [NSString stringWithFormat:@"shuaxin-%d.png", i];
//        // 加载图片
//        
//        // imageNamed: 有缓存(传入文件名)
//        //        UIImage *image =loadAnimation [UIImage imageNamed:filename];
//        
//        // imageWithContentsOfFile: 没有缓存(传入文件的全路径)
//        NSBundle *bundle = [NSBundle mainBundle];
//        NSString *path = [bundle pathForResource:filename ofType:nil];
//        UIImage *image = [UIImage imageWithContentsOfFile:path];
//        //        UIImage *newImage = [LYHControl imageWithImage:image scaledToSize:CGSizeMake(50, 50)];
//        // 添加图片到数组中
//        [images addObject:image];
//    }
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadWebData)];
//    // 设置普通状态的动画图片
//    [header setImages:images forState:MJRefreshStateIdle];
//    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
//    [header setImages:images forState:MJRefreshStatePulling];
//    // 设置正在刷新状态的动画图片
//    [header setImages:images forState:MJRefreshStateRefreshing];
//    // 隐藏时间
//    header.lastUpdatedTimeLabel.hidden = YES;
//    
//    // 隐藏状态
//    header.stateLabel.hidden = YES;
    
    _webView.scrollView.mj_header = header;
    // 开始加载
//    [_webView.scrollView.mj_header beginRefreshing];
}

- (void)loadWebData {
    if (_url) {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
        [_webView loadRequest:request];
    }
}


// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [_webView.scrollView.mj_header endRefreshing];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    [_webView.scrollView.mj_header endRefreshing];
    //TODO: 网络加载失败提示
}

//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//    
//    return YES;
//    
//}

//- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    
//    [_webView.scrollView.mj_header endRefreshing];
//}
//
//- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
//    [_webView.scrollView.mj_header endRefreshing];
//    [LYHControl showWebErrorAlertWithVC:self.cyl_tabBarController];
//}

#pragma mark - 置顶按钮
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == _webView.scrollView) {
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
        if (_webView.scrollView.contentOffset.y >= kSCREEN_HEIGHT / 2) {
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
    if (scrollView == _webView.scrollView) {
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
        if (_webView.scrollView.contentOffset.y >= kSCREEN_HEIGHT / 2) {
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
    [_webView.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    _scrollToTopBtn.alpha = 0;
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    
    //TODO: H5弹窗
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    //  js 里面的alert实现，如果不实现，网页的alert函数无效,
    //TODO: H5弹窗
    
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString *))completionHandler {
    
    completionHandler(@"Client Not handler");
    
}

// https 支持
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler{
    
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        
        NSURLCredential *card = [[NSURLCredential alloc]initWithTrust:challenge.protectionSpace.serverTrust];
        
        completionHandler(NSURLSessionAuthChallengeUseCredential,card);
        
    }
}


@end
