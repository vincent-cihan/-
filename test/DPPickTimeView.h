//
//  DPPickTimeView.h
//  test
//
//  Created by 刘乙灏 on 2017/3/29.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DPPickTimeBlock)(NSInteger beginIndex, NSInteger endIndex, NSString *beginStr, NSString *endStr);

@interface DPPickTimeView : UIView <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView *pickView;
@property (nonatomic, copy) NSMutableArray *firstPickArray;
@property (nonatomic, copy) NSMutableArray *stateArray;
@property (nonatomic, copy) NSMutableArray *secondPickArray;

@property (nonatomic, copy) DPPickTimeBlock DPPickTimeBlock;

- (void)appear;
- (void)hide;

@end
