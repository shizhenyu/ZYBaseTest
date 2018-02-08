//
//  NSAttributedString+ZYKit.h
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,NSAttributeStringImageAlignment) {
    
    NSAttributeStringImageAlignmentTop, // 顶端对齐
    NSAttributeStringImageAlignmentCenter, // 中心点对齐
    NSAttributeStringImageAlignmentBottom // 底端对齐
    
};

@interface NSAttributedString (ZYKit)

/**
 根据正则表达式，匹配文字中存在的图片名称，并替换成图片
 
 @param text 待匹配的文字
 @param regularString 正则表达式
 @return 返回的属性文字
 */
+ (instancetype)replaceImageStringWithText:(NSString *)text
                                   regular:(NSString *)regularString;

/**
 在属性文字上添加图片，并生成新的属性文字
 
 @param imageName 图片名字
 @param alignment 对齐方式
 @return 新的属性文字
 */
- (instancetype)addImage:(NSString *)imageName
      withImageAlignment:(NSAttributeStringImageAlignment)alignment;

/**
 设置属性文字的段落属性
 
 @param lineSpace 文字的行间距
 @param paragraphSpacing 文字段落 间距（前一个段落后的间距）
 @param firstLineHeadIndent 首行缩进的间距
 @return 新的属性文字
 */
- (NSAttributedString *)setParagraphWithLineSpace:(CGFloat)lineSpace
                                 paragraphSpacing:(CGFloat)paragraphSpacing
                              firstLineHeadIndent:(CGFloat)firstLineHeadIndent;

/**
 根据string 和给定的Attributes 生成一个属性字符串
 
 @param string 给定的字符串
 @param attributes 给定的Attributes
 @param range 指定的range
 @return 生成的属性字符串
 */
+ (NSAttributedString *)attributedWithStirng:(NSString *)string
                                  attributes:(NSDictionary *)attributes
                                       range:(NSRange)range;


@end
