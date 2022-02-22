//
//  CustomModalAlertDelegate.m
//  AppleMusic
//
//  Created by Chou Edward  on 2020/4/24.
//  Copyright © 2020 Chou Edward . All rights reserved.
//

#import "CustomModalAlertDelegate.h"

@interface CustomModalAlertDelegate ()
@property (nonatomic,assign) BOOL isShow;

@property (nonatomic,assign) float alpha;

@end

@implementation CustomModalAlertDelegate
+(CustomModalAlertDelegate *)customModalIsShow:(BOOL)isShow withBackgroundAlpha:(float)alpha {
    CustomModalAlertDelegate *cus = CustomModalAlertDelegate.new;
    cus.isShow = isShow;
    cus.alpha = alpha;

    return cus;
}

#pragma mark - Delegate

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;//animation duration is not necessary here, cuz the duration is be given by CoreAnimation after set the animation curve is '7'
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if (_isShow) {
        UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        
        UIView *fromView = fromVC.view;
        UIView *toView = toVC.view;
        UIView *containerView = transitionContext.containerView;
        
        //State at start
        toView.alpha = 0;
        toVC.contentView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
        [containerView addSubview:toView];
        toView.frame = CGRectMake(0, 0, VC_Screnn_Width, VC_Screnn_Height);
        
         __weak typeof(self)weakSelf = self;
        [UIView animateWithDuration:0.3 animations:^{
            [UIView setAnimationCurve:7];
            
            fromView.alpha = weakSelf.alpha;
            toView.alpha = 1.0;
            toVC.contentView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];

        }];
    } else {
        UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

        UIView *fromView = fromVC.view;
        UIView *toView = toVC.view;
        UIView *containerView = transitionContext.containerView;
        
        [UIView animateWithDuration:0.3 animations:^{
            [UIView setAnimationCurve:7];
            
            toView.alpha = 1.0;

            fromView.alpha = 0.0;


        } completion:^(BOOL finished) {
            toView.frame = UIScreen.mainScreen.bounds;
            [transitionContext completeTransition:YES];

        }];
        
    }
   
    
    
}

@end
