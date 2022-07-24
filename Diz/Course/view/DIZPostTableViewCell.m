//
//  DIZPostTableViewCell.m
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//

#import "DIZPostTableViewCell.h"
#import "DIZModelDefine.h"

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
    self.starUserAvatarView = [[UIView alloc] init];
    self.tagListView = [[UIView alloc] init];
    
}

- (void)updateCellWithData:(DIZPostModel *)data {
    self.titleLabel.text = data.title;
    self.contentLabel.text = data.abstractContent;
    self.lastEditLabel.text = data.lastEditDate;
}

//- (void)createTagViewWithData:(NSArray<NSString *> *)tagList {
//    for (NSString *tag in tagList) {
//
//    }
//}

- (UIColor *)randomColor {
    CGFloat redValue = arc4random_uniform(255) / 255.0;
    CGFloat greenValue = arc4random_uniform(255) / 255.0;
    CGFloat blueValue = arc4random_uniform(255) / 255.0;
    CGFloat alphaValue = arc4random_uniform(255) / 255.0;
    return [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:alphaValue];
}

@end
