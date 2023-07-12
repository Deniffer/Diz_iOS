//
//  DIZSideBarViewModel.h
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//  sideBarViewModel 承载着侧边栏的交互逻辑，数据更改响应

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class DIZClassModel,DIZDirectoryModel;

@interface DIZSideBarViewModel : NSObject

@property (nonatomic, copy, readonly) NSArray<DIZClassModel *> *courses;
@property (nonatomic, strong, readonly) DIZClassModel *selectedCourse;

- (void)getFullCourses;
- (void)getCourseDetail:(NSUInteger)CourseId;

@end

NS_ASSUME_NONNULL_END
