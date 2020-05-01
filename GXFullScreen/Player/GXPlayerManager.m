
//  GXPlayerManager.m
//  GXFullScreen
//
//  Created by sgx on 2020/4/27.
//  Copyright © 2020 sgx. All rights reserved.
//

#import "GXPlayerManager.h"
#import "GXPlayerVC.h"

@implementation GXPlayerManager

+ (instancetype)shared {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)playWithContainerView:(UIView *)containerView {
    [containerView addSubview:self.playerVC.view];
    self.playerVC.view.frame = containerView.bounds;
}

- (GXPlayerVC *)playerVC {
    if (!_playerVC) {
        _playerVC = [GXPlayerVC new];
    }
    return _playerVC;
}

- (void)setExpandBlock:(dispatch_block_t)expandBlock {
    self.playerVC.expandBlock = expandBlock;
}

@end
