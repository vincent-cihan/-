//
//  RootViewController.m
//  FreshMarket
//
//  Created by mac on 15/12/5.
//  Copyright © 2015年 vincent-leo. All rights reserved.
//

#import "RootViewController.h"
//#import "MobClick.h"
//#import "UMMobClick/MobClick.h"f


@interface RootViewController ()
@end

@implementation RootViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [MobClick beginLogPageView:NSStringFromClass(self.class)];//("PageOne"为页面名称，可自定义)
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [MobClick endLogPageView:NSStringFromClass(self.class)];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [LYHControl disappearAnimation:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.jz_fullScreenInteractivePopGestureEnabled = YES;
}

- (void)configUI {
    DEBUGLOG_REWRITE_FUNC;
}

/**
 *  添加返回按钮
 */
- (void)addBackBarItem {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    //TODO: 通用返回按钮图片设置
    UIImage *image = [UIImage imageNamed:@"fanhui"];
    [btn setImage:image forState:UIControlStateNormal];
//    [btn setImage:[LYHControl imageWithImage:image scaledToSize:CGSizeMake(8, 15)] forState:UIControlStateHighlighted];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    [btn addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = barBtn;
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
}

/**添加导航栏标题*/
- (void)addTitleViewWithName:(NSString *)name {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200 * kRATE, 40)];
    label.contentMode = UIViewContentModeScaleAspectFill;
    label.text = name;
    label.textColor = kNAV_Text_COLOR;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = kNAV_TITLE_FONT;
    self.navigationItem.titleView = label;
}

/**添加左右导航栏按钮*/
- (void)addBarItemWithTitle:(NSString *)title imageName:(NSString *)imageName direction:(NSString *)direction {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:kRED_COLOR forState:UIControlStateNormal];
        btn.titleLabel.font = kNAV_BUTTON_FONT;
    }
    if (imageName) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    if ([direction isEqualToString:kLEFT_NAVBAR]) {
        [btn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = barBtn;
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    } else if ([direction isEqualToString:kRIGHT_NAVBAR]) {
        [btn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = barBtn;
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    }
}

#pragma mark ----- 按钮点击 -----
- (void)leftClick:(UIButton *)btn {
    DEBUGLOG_REWRITE_FUNC;
}

- (void)rightClick:(UIButton *)btn {
    DEBUGLOG_REWRITE_FUNC;
}

- (void)backClick:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
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
