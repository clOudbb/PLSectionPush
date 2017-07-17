//
//  PLTableViewMessionView.m
//  Navi_test
//
//  Created by 张征鸿 on 2017/7/4.
//  Copyright © 2017年 张征鸿. All rights reserved.
//

#import "PLTableViewMessionView.h"
#import "PLMessionTableViewCell.h"
#import "PLMenuTableViewCell.h"
#import <Masonry.h>
static NSString * const kPLMessionTableViewCell = @"PLMessionTableViewCell";
static NSString * const kPLMenuTableViewCell = @"PLMenuTableViewCell";
@interface PLTableViewMessionView  ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableDictionary *dataSourceCache;
@end

@implementation PLTableViewMessionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataSourceCache = [NSMutableDictionary new];
        for (int i = 0; i < 2; i++) {
            PLModel *model = [PLModel new];
            model.rowNumber = [@[] mutableCopy];
            [model.rowNumber addObject:@(i)];
            [model.rowNumber addObject:@(i + 1)];
            [model.rowNumber addObject:@(i + 2)];
            [_dataSourceCache setObject:model forKey:@(i)];
        }
        
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.tableView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets((UIEdgeInsets){0, 0, 0, 0});
    }];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = 50;
        
        [_tableView registerNib:[UINib nibWithNibName:kPLMessionTableViewCell bundle:nil] forCellReuseIdentifier:kPLMessionTableViewCell];
        [_tableView registerNib:[UINib nibWithNibName:kPLMenuTableViewCell bundle:nil] forCellReuseIdentifier:kPLMenuTableViewCell];
    }
    return _tableView;
}

#pragma mark -- tableView Delegate DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    PLModel *model = [self.dataSourceCache objectForKey:@(section)];
    if (model.open) return model.rowNumber.count + 1;
    else return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSourceCache.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PLModel *model = [self.dataSourceCache objectForKey:@(indexPath.section)];
    if (indexPath.row == 0) {
        PLMessionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPLMessionTableViewCell];
        cell.model = model;
        return cell;
    } else {
        PLMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPLMenuTableViewCell];
        return cell;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    if (indexPath.row == 0) {
//        PLMessionTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        PLModel *model = [self.dataSourceCache objectForKey:@(indexPath.section)];
        model.open = !model.open;
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
