//
//  DIZPostTableViewCell.h
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class DIZPostModel;

@interface DIZPostTableViewCell : UITableViewCell

- (void)updateCellWithData:(DIZPostModel *)data;

@end

NS_ASSUME_NONNULL_END
