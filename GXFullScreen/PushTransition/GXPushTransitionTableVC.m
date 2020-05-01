//
//  GXPushTransitionTableVC.m
//  GXFullScreen
//
//  Created by sgx on 2020/4/27.
//  Copyright © 2020 sgx. All rights reserved.
//

#import "GXPushTransitionTableVC.h"
#import "GXPlayerVC.h"
#import "GXFullScreenVC.h"
#import "GXPushTransitionContext.h"
#import "GXPlayerManager.h"

@interface GXPushTransitionTableView : UITableView

@end

@implementation GXPushTransitionTableView



@end

@interface GXPushTransitionTableVC () <GXPushTransitionContextProtocol>

@end

@implementation GXPushTransitionTableVC



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


// ********************************************************************************************************************
#pragma mark - UIScrollViewDelegate - scrollView回调
// ********************************************************************************************************************

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    [self _tryPlayInlineCard];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self _tryPlayInlineCard];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (velocity.y == 0) {
        [self _tryPlayInlineCard];
    }
}

- (void)_tryPlayInlineCard {
    // 获取当前界面满足播放条件的cell
    UITableViewCell *autoPlayCell = [self canPlayCell];

    __weak typeof(self)weakSelf = self;
    [GXPlayerManager shared].expandBlock = ^{
        __strong typeof(weakSelf)strongSelf = weakSelf;
        GXFullScreenVC *fullScreenVC = [GXFullScreenVC new];
        [strongSelf.navigationController pushViewController:fullScreenVC animated:YES];
    };
    
    [[GXPlayerManager shared] playWithContainerView:autoPlayCell];
}

// ********************************************************************************************************************
#pragma mark - GXPushTransitionContextProtocol
// ********************************************************************************************************************

- (void)completeTransition {
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        GXPushTransitionContext *pushContext = [[GXPushTransitionContext alloc] initWithTransitionModel:[self contextModel]];
        pushContext.delegate = self;
        pushContext.transitionOperation = UINavigationControllerOperationPush;
        return pushContext;
    } else if (operation == UINavigationControllerOperationPop) {
        GXPushTransitionContext *popContext = [GXPushTransitionContext new];
        popContext.delegate = self;
        popContext.transitionOperation = UINavigationControllerOperationPop;
        return popContext;
    }
    return nil;
}

- (GXPushTransitionContextModel *)contextModel {
    GXPushTransitionContextModel *contextModel = [GXPushTransitionContextModel new];
    UIView *playerView = [GXPlayerManager shared].playerVC.view;
    contextModel.transitionView = playerView;
    contextModel.transitionViewRect = [playerView.superview convertRect:playerView.frame toView:self.tableView];
    return contextModel;
}

// ********************************************************************************************************************
#pragma mark - Inline播放相关
// ********************************************************************************************************************

- (UITableViewCell *)canPlayCell {
    for (UITableViewCell *card in self.tableView.visibleCells) {
        // 将contentView的frame转成在keyWindow坐标系下的frame.
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        CGRect contentViewRectAtKeyWindow = [card.superview convertRect:card.frame toView:keyWindow];
        CGFloat contentViewMidYAtKeyWindow = CGRectGetMinY(contentViewRectAtKeyWindow);
        
        // 如果contentView的midY小于0.则直接跳过
        if (contentViewMidYAtKeyWindow < 64) {
            continue;
        }
        
        // 如果contentView的midY大于keyWindow的高度.则直接跳过
        if (contentViewMidYAtKeyWindow > CGRectGetHeight(keyWindow.frame)) {
            continue;
        }
        return card;
    }
    return nil;
}

@end
