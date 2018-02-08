//
//  NSString+ZYKit.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "NSString+ZYKit.h"
#import "NSDate+ZYKit.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (ZYKit)

- (CGFloat)heightWithMaxWidth:(CGFloat)maxWidth font:(UIFont *)font {
    
    if (!self || maxWidth == 0 || !font) return 0;
    
    CGRect rect = [self boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    
    return rect.size.height;
    
}

- (CGFloat)widthWithMaxHeight:(CGFloat)maxHeight font:(UIFont *)font {
    
    if (!self || maxHeight == 0 || !font) return 0;
    
    CGRect rect = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, maxHeight)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    
    return rect.size.height;
    
}

- (NSString *)stringByClearSpecificCharacter:(NSString *)aString {
    
    if (!self) return nil;
    
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)md5String {
    
    const char *str = self.UTF8String;
    
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        
        [strM appendFormat:@"%02x", buffer[i]];
    }
    
    return strM.copy;
    
}

- (NSString *)stringOfIndex:(NSUInteger)index {
    
    char character = [self characterAtIndex:index];
    
    return [NSString stringWithFormat:@"%c",character];
}

- (NSArray *)allCharacters {
    
    NSMutableArray *array = [NSMutableArray array];
    
    const char *characters = [self UTF8String];
    
    for (int i = 0; i < self.length; i++) {
        
        char c = characters[i];
        
        NSString *string = [NSString stringWithFormat:@"%c",c];
        
        [array addObject:string];
    }
    
    return [array copy];
}

- (NSString *)insertSubString:(NSString *)aString atIndex:(NSUInteger)index {
    
    NSMutableString *mString = [self mutableCopy];
    
    [mString insertString:aString atIndex:index];
    
    return [mString copy];
}

- (NSString *)deleteSubString:(NSString *)subString {
    
    NSMutableString *mString = [self mutableCopy];
    
    NSRange range = [mString rangeOfString:subString];
    
    if (range.location != NSNotFound) {
        
        [mString deleteCharactersInRange:range];
        
    }
    
    return [mString copy];
}

- (NSString *)documentDirectory {
    
    NSString *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    return [dir stringByAppendingPathComponent:self];
}

- (NSString *)cachesDirectory {
    
    NSString *dir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    
    return [dir stringByAppendingPathComponent:self];
}

- (NSString *)preferencesDirectory {
    
    NSString *dir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    
    return [[dir stringByDeletingLastPathComponent] stringByAppendingPathComponent:[NSString stringWithFormat:@"Preferences/%@",self.lastPathComponent]];
}

- (NSString *)tempDirectory {
    
    NSString *dir = NSTemporaryDirectory();
    
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
    
}

- (id)jsonStringToObject {
    
    if (!self) return nil;
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    id object = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:NULL];
    
    if (object) {
        return object;
    }
    return nil;
}

+ (NSString *)objectToJsonString:(id)object {
    
    if (!self) return nil;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:NULL];
    
    if (!data) return nil;
    
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
}

+ (NSString *)timeStatusWithTimeStamp:(NSTimeInterval)timestamp {
    
    NSString *status = @"";
    
    NSDate *targetDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSTimeInterval nowTimeInterval = [[NSDate date] timeIntervalSinceDate:targetDate];
    
    if (nowTimeInterval < 60) {
        status = @"刚刚";
    }else if(nowTimeInterval >= 60 && nowTimeInterval < 3600){
        
        int min = (int)(nowTimeInterval / 60.0);
        
        status = [NSString stringWithFormat:@"%d分钟前",min];
        
    }else if(nowTimeInterval >= 3600 && nowTimeInterval <= 24 * 60 * 60 ) {
        
        int hour = (int)(nowTimeInterval / (60 * 60.0));
        
        status = [NSString stringWithFormat:@"%d小时前",hour];
    }else {
        
        NSString *relaitonStr = [targetDate holidayForDate];
        
        if (relaitonStr) {
            
            status = [NSString stringWithFormat:@"%@ %@",relaitonStr,[targetDate stringFromDateWithDateFormat:@"HH:mm"]];
            
        }else {
            
            status = [targetDate stringFromDateWithDateFormat:@"MM-dd HH:mm"];
        }
        
    }
    
    return status;
}

#pragma mark - 正则表达式

- (BOOL)isPhoneNumber
{
    if ([self length] == 0) {
        
        return NO;
    }
    
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0-9])|(17[0-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:self];
    
    if (!isMatch) {
        return NO;
    }
    return YES;
}

- (BOOL)judgeIdentityStringValid {
    if (self.length != 18) return NO;
    // 正则表达式判断基本 身份证号是否满足格式
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(![identityStringPredicate evaluateWithObject:self]) return NO;
    //** 开始进行校验 *//
    //将前17位加权因子保存在数组里
    NSArray *idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
    //这是除以11后，可能产生的11位余数、验证码，也保存成数组
    NSArray *idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
    //用来保存前17位各自乖以加权因子后的总和
    NSInteger idCardWiSum = 0;
    for(int i = 0;i < 17;i++) {
        NSInteger subStrIndex  = [[self substringWithRange:NSMakeRange(i, 1)] integerValue];
        NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
        idCardWiSum      += subStrIndex * idCardWiIndex;
    }
    //计算出校验码所在数组的位置
    NSInteger idCardMod=idCardWiSum%11;
    //得到最后一位身份证号码
    NSString *idCardLast= [self substringWithRange:NSMakeRange(17, 1)];
    //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
    if(idCardMod==2) {
        if(![idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]) {
            return NO;
        }
    }else{
        //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
        if(![idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)isValidChinese {
    NSString *chineseRegex = @"^[\\u4e00-\\u9fa5]+$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", chineseRegex];
    
    BOOL isMatch = [pred evaluateWithObject:self];
    
    if (!isMatch) {
        return NO;
    }
    return YES;
}



@end
