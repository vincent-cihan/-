//
//  ViewController2.m
//  test
//
//  Created by 刘乙灏 on 2017/3/16.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

#import "ViewController2.h"
#import "DPPickTimeView.h"



@interface ViewController2 ()


@property (nonatomic, strong) NSArray *courtArray;
@property (nonatomic, strong) DPPickTimeView *pickTimeView;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _courtArray = @[@"9:00-10:00", @"10:00-11:00", @"11:00-12:00", @"13:00-14:00", @"14:00-15:00", @"15:00-16:00", @"16:00-17:00", @"17:00-18:00"];
    
    [self.view addSubview:self.pickTimeView];
    
    [self.pickTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(kSCREEN_WIDTH - 40);
        make.height.mas_equalTo(150);
    }];
    
    
}

- (DPPickTimeView *)pickTimeView {
    if (!_pickTimeView) {
        _pickTimeView = [[DPPickTimeView alloc] init];
        for (NSString *str in _courtArray) {
            NSArray *timeArray = [str componentsSeparatedByString:@"-"];
            [_pickTimeView.firstPickArray addObject:[timeArray firstObject]];
        }
        for (NSString *str in _courtArray) {
            NSArray *timeArray = [str componentsSeparatedByString:@"-"];
            [_pickTimeView.secondPickArray addObject:[timeArray lastObject]];
        }
        _pickTimeView.stateArray = [@[@1, @1, @0, @0, @0, @1, @0, @1] copy];
        _pickTimeView.DPPickTimeBlock = ^(NSInteger startIndex, NSInteger endIndex, NSString *startStr, NSString *endStr) {
            
        };
    }
    return _pickTimeView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static BOOL isAppear = 0;
    isAppear = !isAppear;
    if (isAppear) {
        [self.pickTimeView appear];
    } else {
        [self.pickTimeView hide];
    }
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
