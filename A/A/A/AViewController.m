//
//  AViewController.m
//  MediatorTest
//
//  Created by Andrew-S-Loptop on 2017/3/21.
//  Copyright © 2017年 shanghaiwow. All rights reserved.
//

#import "AViewController.h"
#import <B_Category/CTMediator+B_Business.h>
#import <HandyFrame/UIView+LayoutMethods.h>

@interface AViewController ()

@property (strong, nonatomic) UIButton *pushBViewControllerButton;

@end

@implementation AViewController

#pragma mark - view cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.pushBViewControllerButton];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.pushBViewControllerButton.size = CGSizeMake(300, 200);
    self.pushBViewControllerButton.center = self.view.center;
}

#pragma mark - button click
- (void)pushBViewControllerButtonClick:(UIButton *)button {
    
//    BViewController *viewController = [[BViewController alloc] initWithContentText:@"Hello world!"];
    
    UIViewController *viewController = [[CTMediator sharedInstance] B_viewControllerWithText:@"Hello world!"];
    
    [self.navigationController pushViewController:viewController animated:YES];
}


#pragma mark - getters and setters
- (UIButton *)pushBViewControllerButton {
    if (!_pushBViewControllerButton) {
        _pushBViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushBViewControllerButton setTitle:@"push B ViewController" forState:UIControlStateNormal];
        [_pushBViewControllerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_pushBViewControllerButton addTarget:self action:@selector(pushBViewControllerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushBViewControllerButton;
}


@end
