//
//  VCTransitionManager.m
//  testTransition
//
//  Created by Chou Edward  on 2020/4/5.
//  Copyright © 2020 mumuda. All rights reserved.
//

#import "VCTransitionManager.h"
#import "CustomModalBottomPresentDelegate.h"
#import "CustomModalAlertDelegate.h"
#import <objc/runtime.h>


static char * const transitionDelegateKey = "transitionDelegateKey";

@interface UIViewController ()
@property (nonatomic,strong) VCTransitionManager *transitionDelegate;

@end

@implementation UIViewController (CustomModal)

- (void)setTransitionDelegate:(VCTransitionManager *)transitionDelegate
{
    objc_setAssociatedObject(self, transitionDelegateKey, transitionDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (VCTransitionManager *)transitionDelegate
{
    return objc_getAssociatedObject(self, transitionDelegateKey);
}

-(void)customPresentViewControllerWithType:(CustomModalType)modalType withViewController:(UIViewController *)viewController withBackgroundAlpha:(float)alpha completion:(void (^)(void))completion
{
    switch (modalType) {
        case CustomModalTypeBottomPresent:
        {
            self.transitionDelegate = [VCTransitionManager managerWithType:modalType withBackgroundAlpha:alpha];
            
            self.transitioningDelegate = self.transitionDelegate;
            viewController.modalPresentationStyle = UIModalPresentationCustom;
            viewController.transitioningDelegate = self.transitionDelegate;
            [self presentViewController:viewController animated:YES completion:completion];
        }
            break;
        case CustomModalTypeAlert:
        {
            self.transitionDelegate = [VCTransitionManager managerWithType:modalType withBackgroundAlpha:alpha];

            self.transitioningDelegate = self.transitionDelegate;
            viewController.modalPresentationStyle = UIModalPresentationCustom;
            viewController.transitioningDelegate = self.transitionDelegate;
            [self presentViewController:viewController animated:YES completion:completion];
        }
            break;
        default:
            [self presentViewController:viewController animated:YES completion:completion];

            break;
    }
}

-(UIView *)contentView {
    return self.view;
}
@end

@interface VCTransitionManager ()
@property (nonatomic,assign) CustomModalType modalType;
@property (nonatomic,assign) float alpha;


@end

@implementation VCTransitionManager

+(instancetype)managerWithType:(CustomModalType)type withBackgroundAlpha:(float)alpha{
    VCTransitionManager *manager = VCTransitionManager.new;
    manager.modalType = type;
    manager.alpha = alpha;
    return manager;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    switch (_modalType) {
        case CustomModalTypeBottomPresent:
            return [CustomModalBottomPresentDelegate customModalIsShow:YES withBackgroundAlpha:_alpha];
            break;
        case CustomModalTypeAlert:
            return [CustomModalAlertDelegate customModalIsShow:YES withBackgroundAlpha:_alpha];
            break;
        default:
            break;
    }
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
        switch (_modalType) {
        case CustomModalTypeBottomPresent:
            return [CustomModalBottomPresentDelegate customModalIsShow:NO withBackgroundAlpha:_alpha];
            break;
        case CustomModalTypeAlert:
            return [CustomModalAlertDelegate customModalIsShow:NO withBackgroundAlpha:_alpha];
            break;
        default:
            break;
    }
}


@end
