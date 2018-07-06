//
//  LoginTextField.m
//  ZYBaseTest
//
//  Created by youyun on 2018/6/29.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import "LoginTextField.h"

@implementation LoginTextField

//  重写文字显示时的X值
- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super textRectForBounds:bounds];
    iconRect.origin.x += kWidth(20);
    return iconRect;
}
//  重写文字输入时的X值
- (CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect editingRect = [super editingRectForBounds:bounds];
    editingRect.origin.x += 20;
    return editingRect;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds {
    
    CGRect rightViewRect = [super rightViewRectForBounds:bounds];
    
    rightViewRect.origin.x -= kWidth(15);
    
    return rightViewRect;
}

@end
