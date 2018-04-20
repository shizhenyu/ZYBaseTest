//
//  QRView.h
//  ZYBaseTest
//
//  Created by youyun on 2018/4/20.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QRView;
@protocol QRViewDelegate <NSObject>
/**
 *  代理回调扫描结果
 *
 *  @param view   扫一扫视图
 *  @param result 扫描结果
 */
- (void)qrView:(QRView*)view ScanResult:(NSString*)result;

@end


@interface QRView : UIView

@property(nonatomic,assign)id<QRViewDelegate> delegate;

/**
 获取扫描框的Frame
 */
@property(nonatomic,assign,readonly)CGRect scanViewFrame;

/**
 开始扫描
 */
- (void)startScan;

/**
 停止扫描
 */
- (void)stopScan;
@end
