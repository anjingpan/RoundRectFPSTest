//
//  myTableViewCell.m
//  RoundRectDemo
//
//  Created by mac on 17/4/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "myTableViewCell.h"

@interface myTableViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *image1View;

@property (strong, nonatomic) IBOutlet UIImageView *image2View;

@property (strong, nonatomic) IBOutlet UIImageView *image3View;

@property (strong, nonatomic) IBOutlet UIImageView *image4View;
@end

@implementation myTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self.contentView layoutIfNeeded];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)addCornerRadiusView:(UIImageView *)imageView{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width * 0.5];
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    switch (self.cellType) {
        case CellRoundRectTypeCornerRadius:
            imageView.layer.cornerRadius = imageView.frame.size.width * 0.5;
            imageView.layer.masksToBounds = YES;
            break;
        case CellRoundRectTypeCAShapeLayer:
            layer.frame = imageView.bounds;
            layer.path = path.CGPath;
            imageView.layer.mask = layer;
            break;
        case CellRoundRectTypeUIGraphics:
            UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, [UIScreen mainScreen].scale);
            [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width] addClip];
            [imageView drawRect:imageView.bounds];
            imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            break;
        default:
            break;
    }
    
    
}

#pragma mark - Setter
- (void)setCellType:(CellRoundRectType)cellType{
    _cellType = cellType;
    [self addCornerRadiusView:self.image1View];
    [self addCornerRadiusView:self.image2View];
    [self addCornerRadiusView:self.image3View];
    [self addCornerRadiusView:self.image4View];
}

@end
