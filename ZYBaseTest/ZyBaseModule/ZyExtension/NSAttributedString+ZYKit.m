//
//  NSAttributedString+ZYKit.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "NSAttributedString+ZYKit.h"

@implementation NSAttributedString (ZYKit)


+ (instancetype)replaceImageStringWithText:(NSString *)text regular:(NSString *)regularString {
    
    __block NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:text];
    
    NSError *error;
    
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regularString options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSMutableArray *imageAttributes = [NSMutableArray array];
    
    [regular enumerateMatchesInString:text options:NSMatchingReportProgress range:NSMakeRange(0, text.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        
        NSRange range = result.range;
        
        if (range.length == 0) {
            
            return;
            
        }
        
        UIImage *image = [UIImage imageNamed:[text substringWithRange:range]];
        
        NSTextAttachment *attachment = [[NSTextAttachment alloc]init];
        
        attachment.image = image;
        
        attachment.bounds = CGRectMake(0, 0, image.size.width / 2.0, image.size.height / 2.0);
        
        NSAttributedString *imageAttributeString = [NSAttributedString attributedStringWithAttachment:attachment];
        
        NSDictionary * dic = @{@"image":imageAttributeString,@"range":result};
        
        [imageAttributes addObject:dic];
        
    }];
    
    for (NSDictionary *imageAttributeString in imageAttributes.reverseObjectEnumerator) {
        
        NSTextCheckingResult *result = imageAttributeString[@"range"];
        
        [string replaceCharactersInRange:result.range withAttributedString:imageAttributeString[@"image"]];
        
    }
    
    return [string copy];
}

- (instancetype)addImage:(NSString *)imageName withImageAlignment:(NSAttributeStringImageAlignment)alignment {
    
    // 获取图片钱的一个文字，并计算其高度,用于对其图片
    NSAttributedString *lastAttributeString = [self attributedSubstringFromRange:NSMakeRange(self.length-1, 1)];
    
    CGSize size = [lastAttributeString boundingRectWithSize:CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:NULL].size;
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    NSMutableAttributedString *mAtt = [self mutableCopy];
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc]init];
    
    attachment.image = image;
    
    CGFloat imageY = 0;
    
    switch (alignment) {
        case NSAttributeStringImageAlignmentTop:
            imageY = -(image.size.height - size.height);
            break;
            
        case NSAttributeStringImageAlignmentCenter:
            imageY = -(image.size.height - size.height) / 2.0;
            break;
            
        case NSAttributeStringImageAlignmentBottom:
            imageY = 0;
            break;
            
        default:
            break;
    }
    
    attachment.bounds = CGRectMake(0, imageY, image.size.width, image.size.height);
    
    NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:attachment];
    
    [mAtt appendAttributedString:imageStr];
    
    return [mAtt copy];
}

- (NSAttributedString *)setParagraphWithLineSpace:(CGFloat)lineSpace
                                 paragraphSpacing:(CGFloat)paragraphSpacing
                              firstLineHeadIndent:(CGFloat)firstLineHeadIndent {
    
    NSMutableAttributedString *mAttr = [self mutableCopy];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    
    style.lineSpacing = lineSpace;
    
    style.paragraphSpacing = paragraphSpacing;
    
    style.firstLineHeadIndent = firstLineHeadIndent;
    
    [mAttr addAttributes:@{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, self.length)];
    
    return [mAttr copy];
}

+ (NSAttributedString *)attributedWithStirng:(NSString *)string attributes:(NSDictionary *)attributes range:(NSRange)range {
    
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc]initWithString:string];
    
    [mAttr addAttributes:attributes range:range];
    
    return [mAttr copy];
}

@end
