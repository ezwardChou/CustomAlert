//
//  CustomModalAlertDelegate.h
//  AppleMusic
//
//  Created by Chou Edward  on 2020/4/24.
//  Copyright © 2020 Chou Edward . All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "VCTransitionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomModalAlertDelegate : NSObject<UIViewControllerAnimatedTransitioning>
+(CustomModalAlertDelegate *)customModalIsShow:(BOOL)isShow withBackgroundAlpha:(float)alpha;

@end

NS_ASSUME_NONNULL_END
