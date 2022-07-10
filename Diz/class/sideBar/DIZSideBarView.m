//
//  DIZSideBarView.m
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//

#import "DIZSideBarView.h"

#define kDIZDirCellHeight 53
#define kDIZClassCellHeight 60

@interface DIZSideBarView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *classTableView;
@property (nonatomic, strong) UITableView *dirTableView;

@end

@implementation DIZSideBarView

- (instancetype)init {
    if (self = [super init]) {
        [self layoutUI];
    }
    return self;
}

- (void)layoutUI {
    self.classTableView = ({
        UITableView *tableView = [[UITableView alloc] init];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = kDIZClassCellHeight;
        tableView;
    });
    self.dirTableView = ({
        UITableView *tableView = [[UITableView alloc] init];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = kDIZDirCellHeight;
        tableView;
    });
    [self addSubview:self.classTableView];
    [self addSubview:self.dirTableView];
    
}

#pragma - tableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.classTableView) {
        
    } else if (tableView == self.dirTableView) {
    
    }
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *from = (tableView == self.classTableView) ? @"class" : @"dir";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:from];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:from];
    }
    return cell;
}

@end
