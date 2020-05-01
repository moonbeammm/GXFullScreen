//
//  GXFullScreenVC.m
//  GXFullScreen
//
//  Created by sgx on 2020/4/27.
//  Copyright © 2020 sgx. All rights reserved.
//

#import "GXFullScreenVC.h"

@interface GXFullScreenView : UIView

@end

@implementation GXFullScreenView


@end

@interface GXFullScreenVC ()

@end

@implementation GXFullScreenVC

- (void)loadView {
    self.view = [GXFullScreenView new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (BOOL)shouldAutorotate {
    return self.supportAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.supportOrientationMask;
}

@end
