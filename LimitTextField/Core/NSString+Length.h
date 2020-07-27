//
//  NSString+Length.h
//  ExampleProject
//
//  Created by Xinbo Lian on 2020/7/26.
//  Copyright © 2020 Xinbo Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Length)
/// 获取字节长度
- (NSInteger)getStringLengthOfBytes;

/// 裁剪字符串by 字节
- (NSString *)subBytesOfstringToIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
