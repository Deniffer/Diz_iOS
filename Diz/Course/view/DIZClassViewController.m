//
//  DIZClassViewController.m
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//
#import <Masonry/Masonry.h>
#import <SDWebImage/SDWebImage.h>

#import "DIZClassViewController.h"
#import "DIZSideBarView.h"
#import "DIZPostTableViewCell.h"
#import "DIZClassViewModel.h"
#import "DIZSideBarViewModel.h"

#define kDIZVisuableCellCount 5
#define kDIZPostCellHeight 170

NSString *avatarString = @"https://avatars.githubusercontent.com/u/46983419?s=400&u=3a60a892b2fef4c1deed273bade6a0d55a90ff2e&v=4";


@interface DIZClassViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) DIZSideBarView *sideBarView;
@property (nonatomic, strong) UITableView *postTableView;
@property (nonatomic, weak) DIZClassViewModel *viewModel;

@end

@implementation DIZClassViewController

- (instancetype)initWithViewModel:(DIZClassViewModel *)viewModel {
    if (self = [super init]) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
}

#pragma TableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kDIZVisuableCellCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DIZPostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"post"];
    if (!cell) {
        cell = [[DIZPostTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"post"];
    }
    //cell updateCellWithData:<#(nonnull DIZPostAbstraction *)#>
    return cell;
}

#pragma Layout

- (void)layoutUI {
    self.containerView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view;
    });
    self.headerView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view;
    });
    self.contentView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view;
    });
    
    [self.view addSubview:self.containerView];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.bottom.mas_equalTo(self.view);
    }];
    [self.containerView addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.mas_equalTo(self.containerView);
        make.height.mas_equalTo(60);
    }];
    [self setupHeaderView];
    [self.containerView  addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerView.mas_bottom);
        make.trailing.leading.bottom.mas_equalTo(self.containerView);
    }];
    [self setupContentView];
}

- (void)setupHeaderView {

    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DIZ_logo"]];
    [self.headerView addSubview:logoView];
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.headerView).offset(10);
        make.size.mas_equalTo(CGSizeMake(60, 35));
    }];
    
    UIView *gapView = [[UIView alloc] init];
    [self.headerView addSubview:gapView];
    gapView.backgroundColor = [UIColor systemGrayColor];
    [gapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(logoView.mas_bottom).offset(3);
        make.bottom.leading.trailing.mas_equalTo(self.headerView);
        make.width.mas_equalTo(1);
    }];
    
    // place remian for user profileView
    UIImageView *profileView = [[UIImageView alloc] init];
    [profileView sd_setImageWithURL:[NSURL URLWithString:avatarString]];
    
//    UIView *profileView = ({
//        UIView *view = [[UIView alloc] init];
//        view.backgroundColor = [UIColor blueColor];
//        view;
//    });
    [self.headerView addSubview:profileView];
    [profileView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.headerView);
        make.trailing.mas_equalTo(self.headerView).offset(-2);
        make.size.mas_equalTo(CGSizeMake(42, 42));
    }];
    profileView.layer.cornerRadius = 22;
    profileView.clipsToBounds = YES;
}

- (void)setupContentView {

    self.sideBarView = [[DIZSideBarView alloc] initWithViewModel:[[DIZSideBarViewModel alloc] init]];
    [self.contentView addSubview:self.sideBarView];
    [self.sideBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.bottom.mas_equalTo(self.contentView);
        make.width.mas_equalTo(600);
    }];
    
    self.postTableView = ({
        UITableView *tableView = [[UITableView alloc] init];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = kDIZPostCellHeight;
        tableView;
    });

    [self.contentView addSubview:self.postTableView];
}

#pragma Getter

@end
