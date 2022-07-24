//
//  DIZSideBarView.m
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//

#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>

#import "DIZSideBarView.h"
#import "DIZSideBarViewModel.h"
#import "DIZModelDefine.h"

#define kDIZDirCellHeight 53
#define kDIZClassCellHeight 60
#define kDIZDefaultCellNumber 5
#define kDIZClassTableViewWidth 92
#define kDIZDirTableViewWidth 394

@interface DIZSideBarView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *classTableView;
@property (nonatomic, strong) UITableView *dirTableView;
@property (nonatomic, strong) DIZSideBarViewModel *viewModel;

@end

@implementation DIZSideBarView

- (instancetype)initWithViewModel:(DIZSideBarViewModel *)viewModel {
    if (self = [super init]) {
        _viewModel = viewModel;
        [self bindAction];
        [self layoutUI];
    }
    return self;
}

- (void)bindAction {
    @weakify(self);
    [[RACObserve(self.viewModel, courses) distinctUntilChanged] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.classTableView reloadData];
    }];
    
    [[RACObserve(self.viewModel, directories) distinctUntilChanged] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.dirTableView reloadData];
    }];
}

- (void)layoutUI {
    self.classTableView = ({
        UITableView *tableView = [[UITableView alloc] init];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = kDIZClassCellHeight;
        tableView.backgroundColor = [UIColor redColor];
        tableView;
    });
    self.dirTableView = ({
        UITableView *tableView = [[UITableView alloc] init];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = kDIZDirCellHeight;
        tableView.backgroundColor = [UIColor grayColor];
        tableView;
    });
    [self addSubview:self.classTableView];
    [self.classTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.leading.mas_equalTo(self).offset(30);
        make.width.mas_equalTo(kDIZClassTableViewWidth);
    }];
    [self addSubview:self.dirTableView];
    [self.dirTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.leading.mas_equalTo(self.classTableView.mas_trailing).offset(1);
        make.width.mas_equalTo(kDIZDirTableViewWidth);
    }];
}

#pragma - tableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.classTableView) {
        NSLog(@"Class tableView Cell id = %ld selected!",indexPath.item);
        [self.viewModel getCourseDetail:[self.viewModel.courses objectAtIndex:indexPath.item].courseId];
    } else if (tableView == self.dirTableView) {
        NSLog(@"Dir tableView  Cell id = %ld selected!",indexPath.item);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.classTableView) {
        return self.viewModel.courses.count;
    } else if (tableView == self.dirTableView) {
        return self.viewModel.directories.count;
    }
    return kDIZDefaultCellNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *from = (tableView == self.classTableView) ? @"class" : @"dir";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:from];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:from];
        UIImageView *courseImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Course_logo"]];
        cell.backgroundColor = [UIColor colorWithWhite:15 alpha:.15];
        [cell.contentView addSubview:courseImageView];
    }
    return cell;
}

@end
