//
//  GXNavigationVC.m
//  GXFullScreen
//
//  Created by sgx on 2020/4/27.
//  Copyright © 2020 sgx. All rights reserved.
//

#import "GXNavigationVC.h"

@interface GXNavigationVC () <UINavigationControllerDelegate>

@end

@implementation GXNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

// ********************************************************************************************************************
#pragma mark - Push
// ********************************************************************************************************************

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        if ([fromVC respondsToSelector:@selector(navigationController:animationControllerForOperation:fromViewController:toViewController:)]) {
            UIViewController <UINavigationControllerDelegate>*tempFromVC = (UIViewController <UINavigationControllerDelegate>*)fromVC;
            return [tempFromVC navigationController:navigationController animationControllerForOperation:operation fromViewController:fromVC toViewController:toVC];
        }
    } else if (operation == UINavigationControllerOperationPop) {
        if ([toVC respondsToSelector:@selector(navigationController:animationControllerForOperation:fromViewController:toViewController:)]) {
            UIViewController <UINavigationControllerDelegate>*tempToVC = (UIViewController <UINavigationControllerDelegate>*)toVC;
            return [tempToVC navigationController:navigationController animationControllerForOperation:operation fromViewController:fromVC toViewController:toVC];
        }
    }
    return nil;
}

@end
