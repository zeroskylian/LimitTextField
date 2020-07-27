//
//  LimitTextConst.h
//  Mira
//
//  Created by Xinbo Lian on 2020/4/7.
//  Copyright © 2020 周鹏. All rights reserved.
//

#ifndef LimitTextConst_h
#define LimitTextConst_h

typedef NS_ENUM(NSInteger, LimitTextFieldLengthType) {
    LengthTypeLength,  //按字符串的长度
    LengthTypeDoubleByte //按双字节字符的长度  汉字属于双字节
};

typedef NS_ENUM(NSInteger, LimitInputType) {
    LimitInputTypeNone = 0,  //无限制输入
    LimitInputTypeNumber  , //只能输入数字
    LimitInputTypeCharaters , //只能输入字母
    LimitInputTypeDecimalNumber , //只能输入 数字小数点
    LimitInputTypeDoubleDotDecimalNumber,/// 两位小数
    LimitInputTypeNumberAndCharater , //只能输入数字和字母
};


NS_INLINE NSString *GetLimitInputTypeString(LimitInputType inputType){
    NSString *limitString ;
    switch (inputType) {
        case LimitInputTypeNone:
            limitString = @"^.*$";
            break;
        case LimitInputTypeNumber:
            limitString = @"^[\\d]*$";
            break;
        case LimitInputTypeCharaters:
            limitString = @"^[a-zA-Z]*$";
            break;
        case LimitInputTypeDecimalNumber:
            limitString = @"^[\\d]*\\.[\\d]*$|^[\\d]*$";
            break;
        case LimitInputTypeDoubleDotDecimalNumber:
            limitString = @"^[\\d]{1,}\\.[\\d]{0,2}$|^[\\d]*$";
            break;
        case LimitInputTypeNumberAndCharater:
            limitString = @"^[a-zA-Z0-9]*$";
            break;
    }
    return limitString;
}
#endif /* LimitTextConst_h */
