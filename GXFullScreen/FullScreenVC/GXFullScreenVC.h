//
//  GXFullScreenVC.h
//  GXFullScreen
//
//  Created by sgx on 2020/4/27.
//  Copyright © 2020 sgx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GXFullScreenVC : UIViewController

@property (nonatomic, assign) BOOL supportAutorotate;
@property (nonatomic, assign) UIInterfaceOrientationMask supportOrientationMask;

@end

NS_ASSUME_NONNULL_END
