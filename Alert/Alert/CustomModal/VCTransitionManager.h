//
//  VCTransitionManager.h
//  testTransition
//
//  Created by Chou Edward  on 2020/4/5.
//  Copyright © 2020 mumuda. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#pragma mark - Constant

#define VC_Screnn_Width UIScreen.mainScreen.bounds.size.width
#define VC_Screnn_Height UIScreen.mainScreen.bounds.size.height


typedef enum : NSUInteger {
    CustomModalTypeBottomPresent,
    CustomModalTypeAlert
    
} CustomModalType;

@class VCTransitionManager;

@interface UIViewController (CustomModal)



/// to present a ViewController by given Style
/// @param modalType the present type, alert or action sheet
/// @param viewController the ViewController you want to present
/// @param alpha the alpha of the background, 1.0 means fully transparent
/// @param completion finished block
-(void)customPresentViewControllerWithType:(CustomModalType)modalType withViewController:(UIViewController *)viewController withBackgroundAlpha:(float)alpha completion:(void(^)(void))completion;



/// the main content view, its necessary
-(UIView *)contentView;
@end


NS_ASSUME_NONNULL_BEGIN

@interface VCTransitionManager : NSObject<UIViewControllerTransitioningDelegate>
+(instancetype)managerWithType:(CustomModalType)type withBackgroundAlpha:(float)alpha;

@end

NS_ASSUME_NONNULL_END
