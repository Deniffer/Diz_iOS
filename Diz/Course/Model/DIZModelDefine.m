//
//  DIZModelDefine.m
//  Diz
//
//  Created by Deniffer on 2022/7/16.
//

#import "DIZModelDefine.h"

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
        @"courseId" : @"course_id",
        @"role" : @""
    };
}

@end

@implementation DIZDirectoryModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"directoryId" : @"directory_id",
        @"dirName" : @"name",
        @"courseId" : @"course_id"
    };
}

@end

@implementation DIZClassModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"courseId" : @"course_id",
        @"className" : @"name",
        @"beginDate" : @"begin_at",
        @"duration" : @"duration",
        @"inviteCode" : @"invite_code",
        @"createdDate" :@"created_at",
        @"members" : @"members",
        //@"directories" : @[@"course_id",@"directory_id",@"name"],
        @"directories" : @"directories",
    };
}

+ (NSValueTransformer *)directoriesJSONTransformer {
//    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
//        return [MTLJSONAdapter dictionaryTransformerWithModelClass:DIZDirectoryModel.class];
//    }];
    return [MTLJSONAdapter arrayTransformerWithModelClass:[DIZDirectoryModel class]];
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

@implementation DIZModelDefine

@end
