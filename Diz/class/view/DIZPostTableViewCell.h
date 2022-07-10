//
//  DIZPostTableViewCell.h
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DIZPostAbstraction : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *abstraction;
@property (nonatomic, copy) NSString *lastUpdated;
@property (nonatomic, strong) NSMutableArray *tagList;
@property (nonatomic, strong) NSMutableArray *usersList; // need to config
@property (nonatomic, assign) BOOL isSloved;

@end

@interface DIZPostTableViewCell : UITableViewCell

- (void)updateCellWithData:(DIZPostAbstraction *)data;

@end

NS_ASSUME_NONNULL_END
