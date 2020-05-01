
//  GXPresentTransitionContext.h
//  GXFullScreen
//
//  Created by sgx on 2020/4/27.
//  Copyright © 2020 sgx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GXTransitionDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface GXPresentTransitionContextModel : NSObject

@property (nonatomic, strong) UIView *transitionView;
@property (nonatomic, assign) CGRect transitionViewRect;

@end

@protocol GXPresentTransitionContextProtocol <NSObject>

- (void)completeTransition;

@end

@interface GXPresentTransitionContext : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) id<GXPresentTransitionContextProtocol> delegate;
@property (nonatomic, assign) UINavigationControllerOperation transitionOperation;

- (instancetype)initWithTransitionModel:(GXPresentTransitionContextModel *)transitionModel;

@end

NS_ASSUME_NONNULL_END
