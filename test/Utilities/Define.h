//
//  Define.h
//  FreshMarket
//
//  Created by mac on 15/12/5.
//  Copyright © 2015年 vincent-leo. All rights reserved.
//
#pragma 日志输出
#ifdef DEBUG

#define DEBUGLOG(...) printf("[文件名:%s] [函数名:%s] [行号:%d] %s\n",__FILE__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:__VA_ARGS__]UTF8String])
#define DDLOG_CURRENT_METHOD NSLog(@"%@-%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))
//#define DEBUGLOG(...) NSLog(__VA_ARGS__)
#define DEBUGLOG_FUNC DEBUGLOG(@"%s", __func__);
#define DEBUGLOG_REWRITE_FUNC DEBUGLOG(@"子类需要重写：%s", __FUNCTION__)
#else
#define DEBUGLOG(...)
#define DDLOG_CURRENT_METHOD
#define DEBUGLOG_FUNC
#define DEBUGLOG_REWRITE_FUNC
#endif


#pragma mark - 屏幕尺寸相关
/**屏幕宽度*/
#define kSCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
/**屏幕高度*/
#define kSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/**适配宽度比例*/
#define kRATE kSCREEN_WIDTH / 375
/**适配高度比例*/
#define kRATE_HEIGHT kSCREEN_HEIGHT / 667
/**tabbar高度*/
#define kTarbarHeight 59


#pragma mark - 配置相关
/**左导航栏按钮*/
#define kLEFT_NAVBAR (@"left_navbar_item")
/**右导航栏按钮*/
#define kRIGHT_NAVBAR (@"right_navbar_item")

#define kWS(weakSelf) __weak typeof(self) weakSelf = self


#define BackgroundColor kWHITE_COLOR
#define MainColor   kRED_COLOR

#pragma mark - 颜色相关
#define kCOLOR_P(r, g, b, p) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:p * 1.0]
#define kCOLOR(r, g, b) kCOLOR_P(r, g, b, 1.0)
/**黑333333*/
#define kBLACK_COLOR kCOLOR(51, 51, 51)
/**导航栏标题颜色*/
#define kNAV_Text_COLOR kBLACK_COLOR
/**深灰背景e0e0e0(个人信息侧边栏背景)*/
#define kDarkGrayBackColor kCOLOR(224, 224, 224)
/**深灰辅助线c8c8c8(个人信息侧边栏辅助线)*/
#define kDarkGrayLineColor kCOLOR(200, 200, 200)
/**浅灰辅助线e5e5e5(财富按钮中间辅助线)*/
#define kLightGrayLineColor kCOLOR(229, 229, 229)
/**红#cb2127*/
#define kRED_COLOR kCOLOR(203, 33, 39)
/**灰##999999*/
#define kGRAY_COLOR kCOLOR(153, 153, 153)
/**白色*/
#define kWHITE_COLOR [UIColor whiteColor]

/**辅助字体颜色#a1a1a1*/
#define kHELP_TEXT_COLOR kCOLOR(161, 161, 161)
/**主题颜色，新68, 186, 183, 44bab7*/
#define kMAIN_COLOR kCOLOR(68, 186, 183)
/**背景 245, 245, 245*/
#define kBACKGROUND_COLOR kCOLOR(245, 245, 245)


/**搜索栏文字*/
#define kSEARCHBAR_TEXTFIELD_TEST_COLOR kCOLOR_P(255, 255, 255, 0.56)

/**黄字#e8c626*/
#define kYELLOW_WORD_COLOR kCOLOR(232, 198, 38)
/**黄背景#f6c233*/
#define kYELLOW_BACK_COLOR kCOLOR(246, 194, 51)
/**黄边框*/
#define kYELLOW_BORD_COLOR kCOLOR(253, 208, 0)
/**绿#0b766c*/
#define kGREEN_COLOR kCOLOR(11, 118, 108)
/**淡绿#05dd00*/
#define kLIGHT_GREEN_COLOR kCOLOR(5, 221, 0)
/**购买按钮绿#1dc28e*/
#define kBUY_BTN_GREEN_COLOR kCOLOR(29, 194, 142)
/**强调紫*/
#define kPURPER_COLOR kCOLOR(85, 98, 138)
/**灰白#f3f5f7*/
#define kGRAY_WHITE_COLOR kCOLOR(243, 245, 247)

/**红包提示文字#ffe5c1*/
#define kRED_PACK_COLOR kCOLOR(255, 229, 193)
/**红包数字#fdd000*/
#define kRED_PACK_NUM_COLOR kCOLOR(253, 208, 0)

#pragma mark - 字体相关
/**导航标题*/
#define kNAV_TITLE_FONT [UIFont boldSystemFontOfSize:15]
/**导航按钮*/
#define kNAV_BUTTON_FONT [UIFont systemFontOfSize:15]
/**加粗二级标题*/
#define kSEC_BOLD_TITLE_FONT [UIFont boldSystemFontOfSize:15]
/**二级标题*/
#define kSEC_TITLE_FONT [UIFont systemFontOfSize:15]
/**三级文字*/
#define kThird_Font [UIFont systemFontOfSize:14]
/**粗正文*/
#define kBOLD_MAIN_TEXT_FONT [UIFont boldSystemFontOfSize:14]
/**辅助说明一级*/
#define kHELP_FIRST_FONT [UIFont systemFontOfSize:13]
/**辅助说明二级*/
#define kHELP_SECOND_FONT [UIFont systemFontOfSize:12]
/**特粗字体*/
#define kHEAVY_FONT(num) [UIFont boldSystemFontOfSize:num]

/**主页滚动按钮*/
#define kHOMEPAGE_SCROLL_BUTTON_FONT [UIFont systemFontOfSize:15]

/**红包提示文字字体*/
#define kRED_PACK_FONT [UIFont systemFontOfSize:17]

#pragma mark 持久化相关

