//
//  myTableViewCell.h
//  RoundRectDemo
//
//  Created by mac on 17/4/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CellRoundRectType) {
    CellRoundRectTypeCAShapeLayer = 1,
    CellRoundRectTypeCornerRadius,
    CellRoundRectTypeUIGraphics,
};

@interface myTableViewCell : UITableViewCell
@property (nonatomic, assign) CellRoundRectType cellType;
@end
