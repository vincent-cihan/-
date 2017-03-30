//
//  DPPickTimeView.m
//  test
//
//  Created by 刘乙灏 on 2017/3/29.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

#import "DPPickTimeView.h"

@interface DPPickTimeView ()

@property (nonatomic, assign) NSInteger firstIndex;
@property (nonatomic, strong) NSMutableArray *currentSecondArray;

@end

@implementation DPPickTimeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.pickView];
        [self configLayout];
        
        self.hidden = YES;
    }
    return self;
}

- (void)configLayout{
    [_pickView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return pickerView.frame.size.width / 2;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.firstPickArray.count;
    } else {
        return self.currentSecondArray.count;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UIView *pickViewCell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width / 2, 40)];
    UILabel *pickLabel = [LYHUIControl labelwithFont:[UIFont systemFontOfSize:15] Text:@""];
    pickLabel.frame = pickViewCell.frame;
    pickLabel.textAlignment = NSTextAlignmentCenter;
    [pickViewCell addSubview:pickLabel];
    if (component == 0) {
        pickLabel.text = self.firstPickArray[row];
        if ([self.stateArray[row] integerValue]) {
            pickLabel.backgroundColor = [UIColor redColor];
        }
    } else {
        BOOL isPre = 0;
        for (NSInteger i = _firstIndex; i <= _firstIndex + row; i++) {
            if ([self.stateArray[i] integerValue]) {
                isPre = 1;
                break;
            }
        }
        if (isPre) {
            pickLabel.backgroundColor = [UIColor redColor];
        }
        pickLabel.text = self.currentSecondArray[row];
    }
    return pickViewCell;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        _firstIndex = row;
        self.currentSecondArray = [[self.secondPickArray subarrayWithRange:NSMakeRange(row, self.secondPickArray.count - row)] copy];
        [_pickView reloadComponent:1];
        if ([self.stateArray[row] integerValue]) {  // 不可选则跳下一个
            if (row < self.firstPickArray.count-1) {
                [pickerView selectRow:row+1 inComponent:0 animated:YES];
                [self pickerView:pickerView didSelectRow:row+1 inComponent:0];
            }
        } else {
            [pickerView selectRow:0 inComponent:1 animated:YES];
            [self pickerView:pickerView didSelectRow:0 inComponent:1];
        }
    } else {
        BOOL isPre = 0;
        for (NSInteger i = _firstIndex; i <= _firstIndex + row; i++) {
            if ([self.stateArray[i] integerValue]) {
                isPre = 1;
                break;
            }
        }
        if (isPre) {    //不可选跳上一个
            if (row > 0) {
                [pickerView selectRow:row-1 inComponent:1 animated:YES];
                [self pickerView:pickerView didSelectRow:row-1 inComponent:1];
            }
        } else {
            DEBUGLOG(@"起始时间：%@, 结束时间：%@", self.firstPickArray[_firstIndex], self.currentSecondArray[row]);
            DEBUGLOG(@"起始标记：%ld, 结束时间：%ld", _firstIndex, row);
            _DPPickTimeBlock(_firstIndex, row, self.firstPickArray[_firstIndex], self.currentSecondArray[row]);
        }
        
        
    }
}

- (UIPickerView *)pickView {
    if (!_pickView) {
        _pickView = [[UIPickerView alloc] init];
        _pickView.backgroundColor = [UIColor grayColor];
        _pickView.dataSource = self;
        _pickView.delegate = self;
    }
    return _pickView;
}

- (NSMutableArray *)firstPickArray {
    if (!_firstPickArray) {
        _firstPickArray = [NSMutableArray array];
    }
    return _firstPickArray;
}

- (NSMutableArray *)secondPickArray {
    if (!_secondPickArray) {
        _secondPickArray = [NSMutableArray array];
    }
    return _secondPickArray;
}

- (NSMutableArray *)currentSecondArray {
    if (!_currentSecondArray) {
        _currentSecondArray = [self.secondPickArray copy];
    }
    return _currentSecondArray;
}

- (NSMutableArray *)stateArray {
    if (!_stateArray) {
        _stateArray = [NSMutableArray array];
    }
    return _stateArray;
}

- (void)appear {
    [self pickerView:self.pickView didSelectRow:0 inComponent:0];
    
    self.hidden = NO;
}

- (void)hide {
    
    self.hidden = YES;
}

@end
