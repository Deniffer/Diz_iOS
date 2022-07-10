//
//  DIZPostTableViewCell.m
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//

#import "DIZPostTableViewCell.h"

@interface DIZPostTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *lastEditLabel;
@property (nonatomic, strong) UIView *starUserAvatarView;
@property (nonatomic, strong) UIView *tagListView;

@end


@implementation DIZPostTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutUI];
    }
    return  self;
}

- (void)layoutUI {
    self.titleLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label;
    });
    self.contentLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label;
    });
    self.lastEditLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label;
    });
    self.lastEditLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label;
    });
    self.starUserAvatarView = [[UIView alloc] init];
    self.tagListView = [[UIView alloc] init];
}

- (void)updateCellWithData:(DIZPostAbstraction *)data {
    
}

@end
