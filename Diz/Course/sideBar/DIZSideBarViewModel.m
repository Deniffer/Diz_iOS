//
//  DIZSideBarViewModel.m
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//

#import "DIZSideBarViewModel.h"
#import "DIZClassApi.h"
#import "DIZModelDefine.h"

@interface DIZSideBarViewModel ()

@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *classDescription;
@property (nonatomic, strong) NSMutableArray *dirArray;

@property (nonatomic, copy, readwrite) NSArray<DIZClassModel *> *courses;
@property (nonatomic, copy, readwrite) NSArray<DIZDirectoryModel *> *directories;

@property (nonatomic, strong) DIZClassApi *api;

@end

@implementation DIZSideBarViewModel

- (instancetype)init {
    if (self = [super init]) {
        _api = [[DIZClassApi alloc] init];
        [self getFullCourses];
        [self createCourseWithName:@"testCourse" duration:-1];
    }
    return self;
}

- (void)getFullCourses {
    [self.api getCourses:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            // show newtork error toast
            return;
        }
        self.courses = [MTLJSONAdapter modelsOfClass:[DIZClassModel class] fromJSONArray:responseObject[@"courses"] error:nil];
    }];
}

- (void)getCourseDetail:(NSUInteger)CourseId {
    [self.api getTargetCourseDetails:CourseId callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
            if (error) {
                return;
            }
            self.directories = [MTLJSONAdapter modelsOfClass:[DIZDirectoryModel class] fromJSONArray:responseObject[@""] error:nil];
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
    }];
}

@end
