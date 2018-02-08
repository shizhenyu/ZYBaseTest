//
//  UIImageView+SDWebImage.m
//  MiddleLove
//
//  Created by 史振宇 on 2017/6/15.
//  Copyright © 2017年 Youzeshi. All rights reserved.
//

#import "UIImageView+SDWebImage.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Extension.h"

@implementation UIImageView (SDWebImage)

- (void)zy_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    
    if (!self) {
        return;
    }
    
    __weak typeof(self)weakSelf = self;
    
    [self sd_setImageWithURL:url placeholderImage:placeholder options:SDWebImageAvoidAutoSetImage | SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (!image) {
            
            return ;
        }
        
        if (cacheType == SDImageCacheTypeNone) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                UIImage *newImg = [image imageFitWithSize:self.bounds.size];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    CATransition *animation = [CATransition animation];
                    
                    animation.duration = 2.f;
                    
                    animation.type = kCATransitionFade;
                    
                    weakSelf.image = newImg;
                    
                    [weakSelf.layer addAnimation:animation forKey:@"imageView_animation"];
                    
                });
                
            });
        }else {
            
            weakSelf.image = image;
        }
        
    }];
}

- (void)zy_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder cornerRadius:(CGFloat)radius {
    
    if (!self) {
        return;
    }
    
    __weak typeof(self)weakSelf = self;
    
    [self sd_setImageWithURL:url placeholderImage:[placeholder imageCornerWithRadius:radius fillColor:self.backgroundColor zoomSize:self.bounds.size] options:SDWebImageAvoidAutoSetImage | SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            
            if (cacheType == SDImageCacheTypeNone) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    
                    UIImage *newImg = [image imageCornerWithRadius:radius fillColor:self.backgroundColor zoomSize:self.bounds.size];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        CATransition *animation = [CATransition animation];
                        
                        animation.duration = 0.5f;
                        
                        animation.type = kCATransitionFade;
                        
                        weakSelf.image = newImg;
                        
                        [weakSelf.layer addAnimation:animation forKey:@"imageView_animation"];
                        
                    });
                    
                });
                
            }else {
                UIImage *newImg = [image imageCornerWithRadius:radius fillColor:self.backgroundColor zoomSize:self.bounds.size];
                weakSelf.image = newImg;
            }
        }
    }];
    
    
}



@end
