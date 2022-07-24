//
//  DIZSideBarView.h
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//  侧边栏承载着最重要的交互视图的作用
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class DIZSideBarViewModel;

@interface DIZSideBarView : UIView

- (instancetype)initWithViewModel:(DIZSideBarViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
