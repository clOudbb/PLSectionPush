//
//  PLMessionTableViewCell.h
//  Navi_test
//
//  Created by 张征鸿 on 2017/7/4.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PLModel;
@interface PLMessionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageVIew;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UIButton *pushButton;

@property (nullable, nonatomic, strong) PLModel *model;

@end
