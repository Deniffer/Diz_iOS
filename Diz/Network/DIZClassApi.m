//
//  DIZClassApi.m
//  Diz
//
//  Created by Deniffer on 2022/7/3.
//

#import "DIZClassApi.h"
#import "DIZNetworkManager.h"
#import "DIZModelDefine.h"

@interface DIZClassApi()

@property (nonatomic, strong) DIZNetworkManager *manager;

@end

@implementation DIZClassApi

- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = [[DIZNetworkManager alloc] initWithBaseUrl:[NSURL URLWithString:@"https://asueeer.com"]];
    }
    return self;
}

- (void)getCourses:(DIZNetworkCallbackBlock)callback {
    [self.manager GET:@"/courses?mock_login=123" params:nil callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject,error);
    }];
}

- (void)getTargetCourseDetails:(NSUInteger)courseId callback:(DIZNetworkCallbackBlock)callback {
    NSDictionary *params = @{
        @"course_id": @(courseId)
    };
    [self.manager GET:@"/course?mock_login=123" params:params callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject ,error);
    }];
}

- (void)deleteCourseWithCourseId:(NSUInteger)courseId callback:(DIZNetworkCallbackBlock)callback {
    NSDictionary *params = @{
        @"course_id": @(courseId)
    };
    [self.manager DELETE:@"/course?mock_login=123" params:params callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject ,error);
    }];
}

- (void)joinCourseWithCourseId:(NSUInteger)courseId {
    
}

- (void)createCourseWithName:(NSString *)className createdAt:(NSString *)currentDate duration:(NSInteger)duration callback:(DIZNetworkCallbackBlock)callback {
    NSDictionary *params = @{
        @"name" : className,
        @"begin_at" : currentDate,
        @"duration" : @(duration)
    };
    [self.manager POST:@"/course?mock_login=123" params:params callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject ,error);
    }];
}

- (void)createDirectoryWithDirInfo:(NSString *)dirName {
    
}

- (void)getPostsWithClassId:(NSUInteger)classId directoryId:(NSUInteger)directoryId {
    
}
 
- (void)createPostWithDetail {
    
}

//#pragma - Getter
//
//- (DIZNetworkManager *)manager {
//    if(!_manager) {
//
//    }
//    return _manager;
//}

@end
