//
//  DIZClassViewController.m
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//
#import <Masonry/Masonry.h>

#import "DIZClassViewController.h"
#import "DIZSideBarView.h"
#import "DIZPostTableViewCell.h"
#import "DIZClassViewModel.h"


#define kDIZVisuableCellCount 5
#define kDIZPostCellHeight 170


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
    [self.containerView addSubview:self.headerView];
    [self.containerView  addSubview:self.contentView];
    [self setupHeaderView];
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
    gapView.backgroundColor = [UIColor colorWithDisplayP3Red:22 green:24 blue:35 alpha:0.1];
    [gapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(logoView.mas_bottom).offset(3);
        make.bottom.leading.trailing.mas_equalTo(self.headerView);
    }];
    
    // place remian for user profileView
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.mas_equalTo(self.view);
        make.height.mas_equalTo(60);
    }];
}

- (void)setupContentView {
    
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
