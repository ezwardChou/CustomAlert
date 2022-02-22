//
//  CustomModalBottomPresentDelegate.h
//  testTransition
//
//  Created by Chou Edward  on 2020/4/5.
//  Copyright © 2020 mumuda. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "VCTransitionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomModalBottomPresentDelegate : NSObject<UIViewControllerAnimatedTransitioning>


+(CustomModalBottomPresentDelegate *)customModalIsShow:(BOOL)isShow withBackgroundAlpha:(float)alpha;

@end

NS_ASSUME_NONNULL_END
