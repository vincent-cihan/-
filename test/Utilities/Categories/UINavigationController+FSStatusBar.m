//
//  UINavigationController+FSStatusBar.m
//  JTXX
//
//  Created by Mac on 16/5/5.
//  Copyright © 2016年 nanjingfeisheng. All rights reserved.
//

#import "UINavigationController+FSStatusBar.h"

@implementation UINavigationController (FSStatusBar)
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}
@end
