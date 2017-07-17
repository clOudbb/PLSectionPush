//
//  PLMessionTableViewCell.m
//  Navi_test
//
//  Created by 张征鸿 on 2017/7/4.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#import "PLMessionTableViewCell.h"
#import "PLModel.h"
@implementation PLMessionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.masksToBounds = true;
}

- (void)setModel:(PLModel *)model
{
    _model = model;
    if (model.open)     self.nickName.text = @"OPEN";
    else    self.nickName.text = @"CLOSE";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
