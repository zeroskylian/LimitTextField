//
//  LimitTextField.h
//  Mira
//
//  Created by Xinbo Lian on 2020/4/7.
//  Copyright © 2020 周鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LimitTextConst.h"

NS_ASSUME_NONNULL_BEGIN

@interface LimitTextField : UITextField<UITextFieldDelegate>

@property (assign, nonatomic) NSUInteger maxLength;

@property (nonatomic, assign) LimitTextFieldLengthType limitType;

@property (nonatomic, assign) LimitInputType inputType;

@property (nonatomic,copy) void(^textDidChangeHandler)(NSString *text);

@property (nonatomic,copy) void(^textDidEndEditHandler)(NSString *text);

+ (instancetype)limitTextFieldWithFrame:(CGRect)frame
                              limitType:(LimitTextFieldLengthType)limitType
                             limitCount:(NSInteger)limitCount;

@end

NS_ASSUME_NONNULL_END
