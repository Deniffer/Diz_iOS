//
//  DIZSideBarViewModel.m
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//

#import "DIZSideBarViewModel.h"
#import "DIZClassApi.h"
#import "DIZModelDefine.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface DIZSideBarViewModel ()

@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *classDescription;
@property (nonatomic, strong) NSMutableArray *dirArray;
@property (nonatomic, strong) NSMutableDictionary <NSNumber *, DIZClassModel *> *coursesDict; // <courseId,courseModel>
@property (nonatomic, copy, readwrite) NSArray<DIZClassModel *> *courses;
// @liuwenqing TODO selectedCourse could be selected Index;
@property (nonatomic, strong, readwrite) DIZClassModel *selectedCourse;
@property (nonatomic, copy, readwrite) NSArray<DIZDirectoryModel *> *directories;

@property (nonatomic, strong) DIZClassApi *api;

@end

@implementation DIZSideBarViewModel

- (instancetype)init {
    if (self = [super init]) {
        _api = [[DIZClassApi alloc] init];
        [self getFullCourses];
        //[self createCourseWithName:@"testCourse" duration:-1];
    }
    return self;
}

- (void)getFullCourses {
    [self.api getCourses:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            // show newtork error toast
            return;
        }
        //
        self.courses = [MTLJSONAdapter modelsOfClass:[DIZClassModel class] fromJSONArray:responseObject[@"courses"] error:nil];
        if (self.courses.count > 0) {
            self.selectedCourse = [self.courses objectAtIndex:0];
        }
        NSLog(@"lwq -- full course : %@",[self.courses description]);
    }];
}

- (void)getCourseDetail:(NSUInteger)courseId {
    [self.api getTargetCourseDetails:courseId callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            return;
        }
        DIZClassModel *course = [MTLJSONAdapter modelOfClass:[DIZClassModel class] fromJSONDictionary:responseObject[@"course"] error:nil];
        NSLog(@"lwq -- course detail %@",course);
        if (course) {
            [self updateCourseDetailWithCourseId:courseId course:course];
            self.selectedCourse = course;
        }
    }];
}

- (void)createCourseWithName:(NSString *)name duration:(NSInteger)duration {
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    dateformat.dateFormat = @"yyyy-MM-dd";
    NSString *currentDate = [dateformat stringFromDate:[NSDate date]];

    [self.api createCourseWithName:name createdAt:currentDate duration:duration callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            return;
        }
        //@liuwenqing TODO Feature  add Remind Animation!
    }];
}

- (void)updateCourseDetailWithCourseId:(NSUInteger)courseId  course:(DIZClassModel *)course {
    //@liuwenqing TODO Optimize
    NSMutableArray *newCourses = [self.courses mutableCopy];
    @weakify(self);
    [self.courses enumerateObjectsUsingBlock:^(DIZClassModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @strongify(self);
        if (obj.courseId == courseId) {
            [newCourses replaceObjectAtIndex:idx withObject:course];
            self.courses = [newCourses copy];
            NSLog(@"lwq -- update Course DONE !, update course Detail : %@",course);
            *stop = YES;
        }
    }];
}

@end
