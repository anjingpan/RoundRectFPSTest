//
//  myTableViewController.h
//  RoundRectDemo
//
//  Created by mac on 17/4/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RoundRectType) {
    RoundRectTypeCAShapeLayer = 1,
    RoundRectTypeCornerRadius,
    RoundRectTypeUIGraphics
};

@interface myTableViewController : UITableViewController

@property (nonatomic, assign) RoundRectType type;
@end
