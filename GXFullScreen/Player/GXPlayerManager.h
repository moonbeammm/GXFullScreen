
//  GXPlayerManager.h
//  GXFullScreen
//
//  Created by sgx on 2020/4/27.
//  Copyright © 2020 sgx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GXPlayerVC;
@interface GXPlayerManager : NSObject

+ (instancetype)shared;
- (void)playWithContainerView:(UIView *)containerView;

@property (nonatomic, strong) GXPlayerVC *playerVC;
@property (nonatomic, copy) dispatch_block_t expandBlock;

@end

NS_ASSUME_NONNULL_END
