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

#pragma mark -- Course Related API

- (void)getCourses:(DIZNetworkCallbackBlock)callback {
    [self.manager GET:@"/courses" params:nil callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject,error);
    }];
}

- (void)getTargetCourseDetails:(NSUInteger)courseId callback:(DIZNetworkCallbackBlock)callback {
    NSDictionary *params = @{
        @"course_id": @(courseId)
    };
    [self.manager GET:@"/course" params:params callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject ,error);
    }];
}

- (void)deleteCourseWithCourseId:(NSUInteger)courseId callback:(DIZNetworkCallbackBlock)callback {
    NSDictionary *params = @{
        @"course_id": @(courseId)
    };
    [self.manager DELETE:@"/course" params:params callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject ,error);
    }];
}

- (void)joinCourseWithCourseId:(NSUInteger)courseId orInviteCode:(NSUInteger)inviteCode callback:(DIZNetworkCallbackBlock)callback {
    NSDictionary *params = @{
        @"course_id": @(courseId),
        @"invite_code" :@(inviteCode)
    };
    [self.manager POST:@"/course/join" params:params callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject ,error);
    }];
}

- (void)createCourseWithName:(NSString *)className createdAt:(NSString *)currentDate duration:(NSInteger)duration callback:(DIZNetworkCallbackBlock)callback {
    NSDictionary *params = @{
        @"name" : className,
        @"begin_at" : currentDate,
        @"duration" : @(duration)
    };
    [self.manager POST:@"/course" params:params callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject ,error);
    }];
}

- (void)createDirectoryWithDirInfo:(NSString *)dirName callback:(DIZNetworkCallbackBlock)callback {
    
}

#pragma mark -- Post Related API

- (void)getPostsWithClassId:(NSUInteger)courseId directoryId:(NSUInteger)directoryId callback:(DIZNetworkCallbackBlock)callback {
    NSDictionary *params = @{
        @"course_id": @(courseId),
        @"directory_id" : @(directoryId)
    };
    [self.manager GET:@"/posts" params:params callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject,error);
    }];
}

- (void)getPostDetailWithPostId:(NSUInteger)postId callback:(DIZNetworkCallbackBlock)callback {
    NSDictionary *params = @{
        @"post_id" : @(postId)
    };
    [self.manager GET:@"/post" params:params callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject, error);
    }];
}

- (void)deletePostWithPostId:(NSUInteger)postId callback:(DIZNetworkCallbackBlock)callback {
    NSDictionary *params = @{
        @"post_id" : @(postId)
    };
    [self.manager DELETE:@"/post" params:params callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject, error);
    }];
}
 
- (void)createPostWithDetail:(DIZNetworkCallbackBlock)callback {
    
}

- (void)updatePostDetail:(DIZPostModel *)post callback:(DIZNetworkCallbackBlock)callback {
    NSDictionary *params = @{
        @"post_id" : @(post.postId),
        @"content" : post.abstractContent,
        @"title" : post.title,
    };
    [self.manager PATCH:@"/post" params:params callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject ,error);
    }];
}

- (void)replyContentWithPostId:(NSUInteger)postId replyContent:(NSString *)replyContent callback:(DIZNetworkCallbackBlock)callback {
    NSDictionary *params = @{
        @"post_id" : @(postId),
        @"content" : replyContent
    };
    [self.manager POST:@"/post" params:params callback:^(id  _Nullable responseObject, NSError * _Nullable error) {
        !callback ?: callback(responseObject, error);
    }];
}

//- (void)

#pragma mark -- User Related API



@end
