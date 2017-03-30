//
//  WebViewController.h
//  JTXX
//
//  Created by Mac on 16/7/25.
//  Copyright © 2016年 nanjingfeisheng. All rights reserved.
//

#import "RootViewController.h"
#import "MJRefresh.h"
#import <WebKit/WebKit.h>

@interface WebViewController : RootViewController <WKNavigationDelegate, WKUIDelegate, UIScrollViewDelegate>
{
    __weak WKWebView *_webView;
}

@property (nonatomic, copy) NSString * url;

- (void)loadWebData;

@end
