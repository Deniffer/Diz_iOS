//
//  DIZUserModel.m
//  Diz
//
//  Created by Deniffer on 2022/6/13.
//

#import "DIZUserModel.h"


@implementation DIZUserModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"uid" : @"",
        @"avatarUrl" : @"",
        @"nickName" : @""
    };
}

@end

@implementation DIZMemberModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return  @{
        @"courseId" : @"",
        @"role" : @""
    };
}

@end

@implementation DIZDirectoryModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"directoryId" : @"",
        @"dirName" : @"",
        @"courseId" : @""
    };
}

@end

@implementation DIZClassModel


+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"classId" : @"",
        @"className" : @"",
        @"beginDate" : @"",
        @"duration" : @"",
        @"inviteCode" : @"",
        @"createdDate" :@"",
        @"memberCount" :@""
    };
}

@end

@implementation DIZCommentModel


+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"commentId" : @"",
        @"replyPostId" : @"",
        @"replyCommentId" : @"",
        @"creator" : @"",
        @"replyer" : @"",
        @"comment_count" : @""
    };
}

@end



