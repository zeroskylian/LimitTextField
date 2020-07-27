//
//  NSString+Length.m
//  ExampleProject
//
//  Created by Xinbo Lian on 2020/7/26.
//  Copyright © 2020 Xinbo Lian. All rights reserved.
//

#import "NSString+Length.h"

@implementation NSString (Length)

- (NSInteger)getStringLengthOfBytes {
    NSInteger length = 0;
    for (int i = 0; i < [self length]; i++) {
        //截取字符串中的每一个字符
        NSString *s = [self substringWithRange:NSMakeRange(i, 1)];
        if ([s validateChineseChar]) {
            length += 2;
        } else {
            length += 1;
        }
    }
    return length;
}

- (BOOL)validateChineseChar {
    NSString *nameRegEx = @"(^[\u4e00-\u9fa5]+$)";
    if (![self isMatchesRegularExp:nameRegEx]) {
        return NO;
    }
    return YES;
}

- (BOOL)isMatchesRegularExp:(NSString *)regex {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (NSString *)subBytesOfstringToIndex:(NSInteger)index {
    NSInteger length = 0;
    NSInteger chineseNum = 0;
    NSInteger otherNum = 0;
    for (int i = 0; i < [self length]; i++) {
        //截取字符串中的每一个字符
        NSString *s = [self substringWithRange:NSMakeRange(i, 1)];
        if ([s validateChineseChar]) {
            if (length + 2 > index) {
                return [self substringToIndex:chineseNum + otherNum];
            }
            length += 2;
            chineseNum += 1;
        } else {
            if (length + 1 > index) {
                return [self substringToIndex:chineseNum + otherNum];
            }
            length += 1;
            otherNum += 1;
        }
    }
    return [self substringToIndex:index];
}
@end
