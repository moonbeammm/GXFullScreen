//
//  GXPlayerVC.m
//  GXFullScreen
//
//  Created by sgx on 2020/4/27.
//  Copyright © 2020 sgx. All rights reserved.
//

#import "GXPlayerVC.h"

@interface GXPlayerVC ()

@property (nonatomic, strong) UIButton *expandBtn;

@end

@implementation GXPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self _configSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// ********************************************************************************************************************
#pragma mark - Initialize Method
// ********************************************************************************************************************

- (void)_configSubviews {
    [self.view addSubview:self.expandBtn];
    self.expandBtn.frame = CGRectMake(20, 20, 100, 30);
}

- (UIButton *)expandBtn {
    if (!_expandBtn) {
        _expandBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _expandBtn.backgroundColor = [UIColor purpleColor];
        [_expandBtn setTitle:@"expand" forState:UIControlStateNormal];
        [_expandBtn addTarget:self action:@selector(expandBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _expandBtn;
}

- (void)expandBtn:(UIButton *)btn {
    NSLog(@"aaaaa");
    if (self.expandBlock) {
        self.expandBlock();
    }
}

@end
