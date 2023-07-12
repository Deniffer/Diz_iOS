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
@property (nonatomic, strong) UIView *dirHeaderView;
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
    
    [[RACObserve(self.viewModel, selectedCourse) distinctUntilChanged] subscribeNext:^(id  _Nullable x) {
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
        tableView.tableHeaderView = self.dirHeaderView;
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

- (UIView *)dirHeaderView {
    UIView *headerContainer = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view;
    });
    [headerContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(200);
        make.width.mas_equalTo(394);
    }];
    UILabel *courseLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont fontWithName:@"Inter" size:16];
        label.textColor = [UIColor blackColor];
        label;
    });
    UILabel *courseDurationLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont fontWithName:@"PingFang HK" size:16];
        label.textColor = [UIColor colorWithRed:189 green:189 blue:189 alpha:1];
        label;
    });
    [headerContainer addSubview:courseLabel];
    [courseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headerContainer).offset(26);
        make.leading.mas_equalTo(31);
        make.width.mas_equalTo(160);
        make.height.mas_equalTo(19);
    }];
    [headerContainer addSubview:courseDurationLabel];
    [courseDurationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(courseLabel.mas_bottom).offset(7);
        make.leading.mas_equalTo(courseLabel);
        make.width.mas_equalTo(119);
        make.height.mas_equalTo(22);
    }];
    
    UIButton *addNewPostButton = ({
        UIButton *button = [[UIButton alloc] init];
        button.layer.masksToBounds = YES;
        button.backgroundColor = [UIColor colorWithRed:68 green:183 blue:94 alpha:1];
        [button setTitle:@"+ 新建帖子" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onClickedCreateNewPostButton) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    [headerContainer addSubview:addNewPostButton];
    [addNewPostButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(headerContainer);
        make.top.mas_equalTo(courseDurationLabel).offset(23);
        make.height.mas_equalTo(36);
        make.width.mas_equalTo(361);
    }];
    return headerContainer;
}

#pragma mark -- Button Action

- (void)onClickedCreateNewPostButton {
    
}

#pragma - tableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.classTableView) {
        NSLog(@"lwq -- Class tableView Cell id = %ld selected!",indexPath.item);
        [self.viewModel getCourseDetail:[self.viewModel.courses objectAtIndex:indexPath.item].courseId];
    } else if (tableView == self.dirTableView) {
        NSLog(@"lwq -- Dir tableView  Cell id = %ld selected!",indexPath.item);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.classTableView) {
        return self.viewModel.courses.count;
    } else if (tableView == self.dirTableView) {
        return self.viewModel.selectedCourse.directories.count;
    }
    return kDIZDefaultCellNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *from = (tableView == self.classTableView) ? @"class" : @"dir";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:from];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:from];
        cell.backgroundColor = [UIColor colorWithWhite:15 alpha:.15];
        if ([from isEqualToString:@"class"]) {
            UIImageView *courseImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Course_logo"]];
            [cell.contentView addSubview:courseImageView];
        } else if ([from isEqualToString:@"dir"]) {
            DIZDirectoryModel *dir = [self.viewModel.selectedCourse.directories objectAtIndex:indexPath.item];
            NSString *dirName = dir.dirName;
            NSLog(@"lwq -- create dir table Cell, dirName = %@",dirName);
            UIView *dirCell = [self createDirViewCellWithDirName:dirName];
            [cell.contentView addSubview:dirCell];
            [dirCell mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(cell.contentView);
            }];
        }
    }
    return cell;
}

- (UIView *)createDirViewCellWithDirName:(NSString *)name {
    UIView *dirCell = ({
        UIView *view = [[UIView alloc] init];
        view;
    });
    UILabel *dirName = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = name;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont fontWithName:@"PingFang TC" size:14.f];
        label;
    });
    [dirCell addSubview:dirName];
    [dirName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(dirCell).offset(17);
        make.centerY.mas_equalTo(dirCell);
        make.height.mas_equalTo(20);
    }];
    return dirCell;
}

@end
