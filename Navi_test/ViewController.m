//
//  ViewController.m
//  Navi_test
//
//  Created by 张征鸿 on 2017/4/10.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#import "ViewController.h"
#import "PLTableViewMessionView.h"
#import <Masonry.h>
@import ObjectiveC;
#define kRGB(R, G, B)               [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:1.0f]

@interface ViewController ()
@property (nonatomic, nullable, strong) PLTableViewMessionView *tableViewMessionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableViewMessionView];
    [self.tableViewMessionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets((UIEdgeInsets){0, 0, 0, 0});
    }];

}

- (PLTableViewMessionView *)tableViewMessionView
{
    if (!_tableViewMessionView) {
        _tableViewMessionView = [[PLTableViewMessionView alloc] init];
    }
    return _tableViewMessionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
