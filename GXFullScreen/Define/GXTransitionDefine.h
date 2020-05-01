//
//  GXTransitionDefine.h
//  GXFullScreen
//
//  Created by sgx on 2020/4/27.
//  Copyright © 2020 sgx. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifndef GXTransitionDefine_h
#define GXTransitionDefine_h

typedef enum : NSUInteger {
    GXNavigationControllerOperationNone,
    GXNavigationControllerOperationPush,
    GXNavigationControllerOperationPop,
    GXNavigationControllerOperationPresent,
    GXNavigationControllerOperationDismiss,
} GXNavigationControllerOperation;

#endif /* GXTransitionDefine_h */
