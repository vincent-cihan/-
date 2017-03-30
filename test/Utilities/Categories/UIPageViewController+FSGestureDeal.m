//
//  UIPageViewController+FSGestureDeal.m
//  JTXX
//
//  Created by Mac on 16/3/16.
//  Copyright © 2016年 vincentLeo. All rights reserved.
//

#import "UIPageViewController+FSGestureDeal.h"

@implementation UIPageViewController (FSGestureDeal)
// pageViewontroller同时响应拖动和滑动手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    /**
     *  两种手势都是拖动手势（UIPageViewController 和 UITableView冲突），不可同时响应返回NO
     */
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] &&
        [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        return NO;
    }
    
    /**
     *  同事响应多种手势返回YES
     */
    return YES;
}

//解决边缘自动翻页跟控件冲突的问题
-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        
        return NO;
    }
    
    return YES;
    
}

//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] &&
//        [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
//        return NO;
//    }
//    return NO;
//}
@end
