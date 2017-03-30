
//  RootViewController.h
//  FreshMarket
//
//  Created by mac on 15/12/5.
//  Copyright © 2015年 vincent-leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (nonatomic, strong) UINavigationController * nc;

@property (nonatomic, weak) UIImageView * loadImageView;
- (void)configUI;
/**添加导航栏标题*/
- (void)addTitleViewWithName:(NSString *)name;

/**添加左右导航栏按钮*/
- (void)addBarItemWithTitle:(NSString *)title imageName:(NSString *)imageName direction:(NSString *)direction;


/**
 *  添加返回按钮
 */
- (void)addBackBarItem;

#pragma mark ----- 点击 -----

- (void)backClick:(UIButton *)btn;
- (void)leftClick:(UIButton *)btn;
- (void)rightClick:(UIButton *)btn;


@end
