//
//  CustomModalBottomPresentDelegate.m
//  testTransition
//
//  Created by Chou Edward  on 2020/4/5.
//  Copyright © 2020 mumuda. All rights reserved.
//

#import "CustomModalBottomPresentDelegate.h"

#define __WindowWidth [UIApplication sharedApplication].keyWindow.frame.size.width
#define __WindowHeight [UIApplication sharedApplication].keyWindow.frame.size.height

@interface CustomModalBottomPresentDelegate ()
@property (nonatomic,assign) BOOL isShow;
@property (nonatomic,assign) float alpha;

@end

@implementation CustomModalBottomPresentDelegate
+(CustomModalBottomPresentDelegate *)customModalIsShow:(BOOL)isShow withBackgroundAlpha:(float)alpha
{
    CustomModalBottomPresentDelegate *cus = CustomModalBottomPresentDelegate.new;
    cus.isShow = isShow;
    cus.alpha = alpha;

    return cus;
}


#pragma mark - Delegate

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if (_isShow) {
        UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        
        UIView *fromView = fromVC.view;
        UIView *toView = toVC.view;
        UIView *containerView = transitionContext.containerView;
        
         __weak typeof(self)weakSelf = self;
        [containerView addSubview:toView];
        toView.frame = CGRectMake(0, __WindowHeight, __WindowWidth, __WindowHeight);
        [UIView animateWithDuration:0.3 animations:^{
            [UIView setAnimationCurve:7];
            
            fromView.alpha = weakSelf.alpha;
            
            toView.frame = CGRectMake(0, 0, __WindowWidth, __WindowHeight);
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
            
            toView.alpha = 1;
            
            /*
             ContentView
             
             For the VC that pops up from the bottom, its main content (contentView) may only occupy a small part of the bottom of the view, and other parts are generally gray and transparent. If it disappears at this time, set the y value of the entire VC.view to ScreenHeight, the main content (contentView) will disappear very quickly.
                          
            So when dismissing, you should set the y value of contentView to ScreenHeight, so that the visual effect is that it (contentView) slides down and disappears.
             */

            fromVC.contentView.frame = CGRectMake(0, __WindowHeight, fromView.frame.size.width, fromVC.contentView.frame.size.height);
        } completion:^(BOOL finished) {
            toView.frame = CGRectMake(0, 0, __WindowWidth, __WindowHeight);
            [transitionContext completeTransition:YES];

        }];
        
    }
   
    
    
}


@end
