
//  GXPushTransitionContext.h
//  GXFullScreen
//
//  Created by sgx on 2020/4/27.
//  Copyright © 2020 sgx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GXTransitionDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface GXPushTransitionContextModel : NSObject

@property (nonatomic, strong) UIView *transitionView;
@property (nonatomic, assign) CGRect transitionViewRect;

@end

@protocol GXPushTransitionContextProtocol <NSObject>

- (void)completeTransition;

@end

@interface GXPushTransitionContext : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) id<GXPushTransitionContextProtocol> delegate;
@property (nonatomic, assign) GXNavigationControllerOperation transitionOperation;

- (instancetype)initWithTransitionModel:(GXPushTransitionContextModel *)transitionModel;

@end

NS_ASSUME_NONNULL_END
