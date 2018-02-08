//
//  ProductCommentModel.h
//  ZYBaseFrameWork
//
//  Created by youyun on 2018/2/1.
//  Copyright © 2018年 TaoSheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductCommentModel : NSObject

/** 评论人的头像 */
@property (nonatomic, copy) NSString *userAvatar;

/** 评论人的名字 */
@property (nonatomic, copy) NSString *userName;

/** 评论人的Id */
@property (nonatomic, copy) NSString *user_Id;

/** 评论人的评论时间 */
@property (nonatomic, copy) NSString *comment_time;

/** 评论人的描述 */
@property (nonatomic, copy) NSString *productDescribe;

/** 评论人的评论内容 */
@property (nonatomic, copy) NSString *content;

/** 评论人的评论图片 */
@property (nonatomic, strong) NSArray *content_pic;

/** 浏览次数 */
@property (nonatomic, copy) NSString *viewCount;

/** 点赞的数量 */
@property (nonatomic, copy) NSString *zanCount;

@end
