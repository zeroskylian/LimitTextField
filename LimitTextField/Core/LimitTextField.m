//
//  LimitTextField.m
//  Mira
//
//  Created by Xinbo Lian on 2020/4/7.
//  Copyright © 2020 周鹏. All rights reserved.
//

#import "LimitTextField.h"
#import "NSString+Length.h"

@interface LimitTextField ()

@property (strong, nonatomic) NSRegularExpression *regular;

@end


@implementation LimitTextField

+ (instancetype)limitTextFieldWithFrame:(CGRect)frame
                              limitType:(LimitTextFieldLengthType)limitType
                             limitCount:(NSInteger)limitCount;
{
    LimitTextField *tf = [[LimitTextField alloc]initWithFrame:frame];
    tf.maxLength = limitCount;
    tf.limitType = limitType;
    return tf;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        [self addTarget:self action:@selector(textFieldTextDidChange:) forControlEvents:UIControlEventEditingChanged];
        self.limitType = LimitInputTypeNone;
        _maxLength = NSUIntegerMax;
    }
    return self;
}
-(NSRegularExpression *)regular
{
    if (_regular == nil) {
        NSError *error = nil;
        _regular = [[NSRegularExpression alloc]initWithPattern:GetLimitInputTypeString(self.inputType) options:NSRegularExpressionCaseInsensitive error:&error];
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        }
    }
    return _regular;
}

#pragma mark - delegate
-(void)textFieldTextDidChange:(UITextField *)textField
{
    UITextRange *selectedRange = [textField markedTextRange];
    NSString * newText = [textField textInRange:selectedRange];
    if (newText.length == 0) {
        NSInteger currentLength  = 0;
        switch (self.limitType) {
            case LengthTypeLength:
                currentLength = textField.text.length;
                break;
            case LengthTypeDoubleByte:
                currentLength = [textField.text getStringLengthOfBytes];
                break;
        }
        
        if (currentLength > _maxLength) {
            switch (self.limitType) {
                case LengthTypeLength:
                    textField.text = [textField.text substringToIndex:_maxLength];
                    break;
                case LengthTypeDoubleByte:
                    textField.text = [textField.text subBytesOfstringToIndex:_maxLength];
                    break;
            }
        }
    }
    if (_textDidChangeHandler) {
        _textDidChangeHandler(textField.text);
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self.undoManager removeAllActions];
    NSString *full = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSArray<NSTextCheckingResult *> *numberOfMatches = [self.regular matchesInString:full options:0 range:NSMakeRange(0, full.length)];
    return numberOfMatches.count != 0;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (_textDidEndEditHandler) {
        _textDidEndEditHandler(textField.text);
    }
}
@end
