//
//  ViewController.m
//  RoundRectDemo
//
//  Created by mac on 17/4/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"
#import "myTableViewController.h"

typedef NS_ENUM(NSInteger, ButtonType) {
    ButtonTypeCornerRadius = 1,
    ButtonTypeCAShapeLayer,
    ButtonTypeUIGraphics,
};

static NSString *const kMyTableViewCell = @"myTableViewCell";

@interface ViewController ()

@property (nonatomic, strong) UIButton *layerCornerButton;
@property (nonatomic, strong) UIButton *graphicsButton;
@property (nonatomic, strong) UIButton *cashapeButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"圆角按钮FPS测试";
    
    [self initButton];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Init View
- (void)initButton{
    CGFloat buttonWidth  = 200.f;
    CGFloat buttonHeight = 40.f;
    CGFloat marginY      = 60.f;
    
    self.layerCornerButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, 0, buttonWidth, buttonHeight);
        button.center = CGPointMake([[UIScreen mainScreen] bounds].size.width * 0.5, [[UIScreen mainScreen] bounds].size.height * 0.5);
        button.backgroundColor = [UIColor redColor];
        button.tag = ButtonTypeCornerRadius;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:@"使用layer cornerRadius设置" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button;
    });
    
    self.cashapeButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width - buttonWidth) * 0.5, CGRectGetMinY(self.layerCornerButton.frame) - marginY - buttonHeight, buttonWidth, buttonHeight);
        button.backgroundColor = [UIColor grayColor];
        button.tag = ButtonTypeCAShapeLayer;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:@"贝塞尔配合CAShapeLayer" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button;
    });
    
    self.graphicsButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width - buttonWidth) * 0.5, CGRectGetMaxY(self.layerCornerButton.frame) + marginY, buttonWidth, buttonHeight);
        button.backgroundColor = [UIColor blueColor];
        button.tag = ButtonTypeUIGraphics;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:@"贝塞尔配合UIGraphics" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button;
    });
}

#pragma mark - Button Click
- (void)clickButton:(UIButton *)button{
    myTableViewController *VC = [[myTableViewController alloc] init];
    switch (button.tag) {
        case ButtonTypeCornerRadius:
            VC.type = RoundRectTypeCornerRadius;
            break;
        case ButtonTypeUIGraphics:
            VC.type = RoundRectTypeUIGraphics;
            break;
        case ButtonTypeCAShapeLayer:
            VC.type = RoundRectTypeCAShapeLayer;
            break;
        default:
            break;
    }
    VC.title = [button titleForState:UIControlStateNormal];
    [self.navigationController pushViewController:VC animated:YES];
}
@end
