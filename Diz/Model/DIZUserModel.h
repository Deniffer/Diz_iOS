//
//  DIZUserModel.h
//  Diz
//
//  Created by Deniffer on 2022/6/13.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,DIZClassPostType) {
    DIZClassPostTypeNote,
    DIZClassPostTypeQuestion
};

/// DIZUserModel  store the basic User Info
@interface DIZUserModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger uid;
@property (nonatomic, copy) NSString *avatarUrl;
@property (nonatomic, copy) NSString *nickName;

@end

/// DIZMemberModel store the class related Info
@interface DIZMemberModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) DIZUserModel *userInfo;
@property (nonatomic, assign) NSUInteger courseId;
@property (nonatomic, copy) NSString *role;

@end

@interface DIZDirectoryModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger directoryId;
@property (nonatomic, copy) NSString *dirName;
@property (nonatomic, assign) NSUInteger courseId;

@end

/// DIZClassModel store the whole class reated Info
@interface DIZClassModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger classId;
@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *beginDate;
@property (nonatomic, assign) NSInteger duration; // class duration, if duration == -1  means long term
@property (nonatomic, copy) NSString *inviteCode;
@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, copy) NSArray<DIZMemberModel *> *members;
@property (nonatomic, copy) NSArray <DIZDirectoryModel *> *directories;
@property (nonatomic, assign) NSUInteger membersCount;

@end

@interface DIZCommentModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger commentId;
@property (nonatomic, assign) NSUInteger replyPostId;
@property (nonatomic, assign) NSUInteger replyCommentId;
@property (nonatomic, strong) DIZMemberModel *creator;
@property (nonatomic, strong) DIZMemberModel *replyer;
@property (nonatomic, assign) NSUInteger comment_count;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, assign) BOOL isLiked;

@end

@interface DIZPostModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger postId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray<DIZDirectoryModel *> *directories;
//@property (nonatomic, copy)
@property (nonatomic, assign) DIZClassPostType type;
@property (nonatomic, assign) NSUInteger owner;
@property (nonatomic, copy) NSString *abstractContent;
@property (nonatomic, strong) NSMutableDictionary *commentArray;
@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, copy) NSString *lastEditDate;
@property (nonatomic, assign) BOOL isSolved;
@property (nonatomic, assign) BOOL isLocked;

@end




NS_ASSUME_NONNULL_END
