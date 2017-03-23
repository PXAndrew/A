//
//  ViewController.m
//  A
//
//  Created by Andrew-S-Loptop on 2017/3/23.
//  Copyright © 2017年 shanghaiwow. All rights reserved.
//

#import "ViewController.h"
#import <HandyFrame/UIView+LayoutMethods.h>
#import "AViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *button;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.view addSubview:self.button];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    
    self.button.size = CGSizeMake(100, 100);
    [self.button centerEqualToView:self.view];
    
}

#pragma mark - event reponds
- (void)didTappedButton:(UIButton *)button {
    
    UIViewController *viewController = [[AViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}


#pragma mark - getters and setters
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"show A" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(didTappedButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}


@end
