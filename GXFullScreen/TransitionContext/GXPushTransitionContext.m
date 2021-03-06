
//  GXPushTransitionContext.m
//  GXFullScreen
//
//  Created by sgx on 2020/4/27.
//  Copyright © 2020 sgx. All rights reserved.
//

#import "GXPushTransitionContext.h"

@implementation GXPushTransitionContextModel



@end

@interface GXPushTransitionContext ()

@property (nonatomic, strong) GXPushTransitionContextModel *transitionModel;

@end

@implementation GXPushTransitionContext

- (instancetype)initWithTransitionModel:(GXPushTransitionContextModel *)transitionModel {
    self = [super init];
    if (self) {
        self.transitionModel = transitionModel;
    }
    return self;
}

// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    UIView *containerView = transitionContext.containerView;
  
    CGRect initialFrameOfFromVC = [transitionContext initialFrameForViewController:fromVC];
    CGRect finalFrameOfFromVC = [transitionContext finalFrameForViewController:fromVC];
    
    CGRect initialFrameOfToVC = [transitionContext initialFrameForViewController:toVC];
    CGRect finalFrameOfToVC = [transitionContext finalFrameForViewController:toVC];

    NSLog(@"\nfromVC: %@; \ntoVC: %@; \nfromView: %@; \ntoView: %@; \ncontainerView: %@; \ninitialFrameOfFromVC: %@; \nfinalFrameOfFromVC: %@; \ninitialFrameOfToVC: %@; \nfinalFrameOfToVC: %@; \ncontainerViewSubViews:%@",fromVC, toVC, fromView, toView, containerView, @(initialFrameOfFromVC), @(finalFrameOfFromVC), @(initialFrameOfToVC), @(finalFrameOfToVC), containerView.subviews);
    
    
    
    
    
    
    
    [containerView addSubview:toVC.view];
    
    [transitionContext completeTransition:YES];
}

@end
