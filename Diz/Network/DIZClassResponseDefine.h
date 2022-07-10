//
//  DIZClassResponseDefine.h
//  Diz
//
//  Created by Deniffer on 2022/7/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DIZClassResponseDefine : NSObject

@end

struct Meta {
    int32_t code;
    NSString *string;
};

@interface metaStructure : NSObject

@property (nonatomic, assign) NSUInteger code;
@property (nonatomic, copy) NSString *string;

@end

//1: optional i32 course_id;
//2: string name; // 课程名称
//3: string begin_at; // 课程开始时间，精确至天，形如"2006-01-02"
//4: i32 duration; // 课程时长，单位为天，-1表示"长期"
//5: optional string invite_code; // 邀请码
//6: optional list<user.Member> members;
//7: optional list<Directory> directories;
//8: string created_at; // 创建时间
//9: i32 members_count; // 成员人数
@interface CourseStructure : NSObject

@property (nonatomic, assign) NSUInteger class_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *begin_at;
@property (nonatomic, assign) NSUInteger duration;
@property (nonatomic, copy) NSString *invite_code;
//@property (nonatomic, )
//@property (nonatomic, )
@property (nonatomic, copy) NSString *create_at;
@property (nonatomic, assign) NSUInteger members_count;

@end

@interface directoryStructure : NSObject

@property (nonatomic, assign) NSUInteger directory_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger course_id;

@end

//struct Comment{
//    1: i32 comment_id;
//    2: i32 reply_post_id; // 必有一个值，表示一个帖子下面的一级评论或二级评论
//    3: i32 reply_comment_id; //
//    4: user.Member creator; // 创建人
//    5: string comment; // 评论正文
//    6: user.Member reply_to; // 回复的用户(帖子的主人或者发表一级评论的人)
//    7: i32 comment_count; // 回复该评论的数量
//    8: string created_at; // 评论的创建时间
//    9: bool liked; // 点过赞了
//}
@interface commentStrcuture : NSObject

@property (nonatomic, assign) NSUInteger comment_id;
@property (nonatomic, assign) NSUInteger reply_post_id;
@property (nonatomic, assign) NSUInteger reply_comment_id;
@property (nonatomic, copy) NSString *comment;
//@property (nonatomic, )
//@property (nonatomic, )
@property (nonatomic, assign) NSUInteger comment_count;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, assign) BOOL liked;

@end

@interface userStructure : NSObject

@property (nonatomic, assign) NSUInteger uid;
@property (nonatomic, copy) NSString *nick_name;
@property (nonatomic, copy) NSString *avatarUrl;

@end

@interface memberStructure : NSObject

@property (nonatomic, strong) userStructure *userInfo;
@property (nonatomic, assign) NSUInteger courseId;
@property (nonatomic, copy) NSString *role;

@end

//struct Post{
//    1: optional i32 post_id;
//    2: string title; // 标题
//    4: list<course.Directory> directories; // 关联分组
//    5: optional string last_replied_at; // 最新回复时间
//    6: optional list<user.Member> repliers; // 解答人
//    7: optional user.Member creator; // 创建人
//    8: optional bool solved; // 是否已解答
//}

@interface postStructure : NSObject

@property (nonatomic, assign) NSUInteger post_id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *last_replied_at;
@property (nonatomic, copy) NSArray<memberStructure *> *repliers;
@property (nonatomic, strong) memberStructure *creator;
@property (nonatomic, assign) BOOL isSolved;

@end

//struct PostDetail{
//    1: optional i32 post_id;
//    2: string title; // 标题
//    4: list<course.Directory> directories; // 关联分组
//    5: string content; // 正文
//    6: optional string reply_content; // 解答正文
//    7: optional list<user.Member> repliers; // 解答人
//    8: optional bool reply_state; // 解答状态
//    9: optional string updated_at; // 帖子最近修改时间（包括评论、编辑、回复等中最近的时间）
//    10: optional string post_content_updated_at; // 帖子本体最新编辑时间
//    11: optional string reply_content_updated_at; // 解答正文最新编辑时间
//    12: optional bool is_locked; // 帖子是否锁定
//    13: string type; // 类型; 枚举值： "note"-文章/笔记；"question"-提问
//    14: optional string created_at; // 创建时间
//    16: optional user.Member creator; // 创建人
//    17: optional bool solved; // 是否已解答
//    18: optional string last_replied_at; // 最近回复时间
//    19: i32 comment_count; // 该帖子的评论数量
//    20: bool liked; // 点过赞了
//    21: optional string last_commented_at;
//}

typedef NS_ENUM(NSUInteger, DIZPostReplyState) {
    DIZPostReplyStateUnsolve = 0,
    DIZPostReplyStateSolved = 1,
    DIZPostReplyStateClosed = 2
};

typedef NS_ENUM(NSUInteger,DIZClassPostType) {
    DIZClassPostTypeNote,
    DIZClassPostTypeQuestion
};

@interface postDetailStructure : NSObject

@property (nonatomic, assign) NSUInteger postId;
@property (nonatomic, copy) NSString *title;
//@property (nonatomic, )
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *replyContent;
@property (nonatomic, copy) NSArray<memberStructure *> *repliers;
@property (nonatomic, assign) DIZPostReplyState replyState;
@property (nonatomic, copy) NSString *updated_at;
@property (nonatomic, copy) NSString *post_content_updated_at;
@property (nonatomic, copy) NSString *reply_content_updated_at;
@property (nonatomic, assign) BOOL isLocked;
@property (nonatomic, assign) DIZClassPostType type;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, strong) memberStructure *creator;
@property (nonatomic, assign) BOOL isSloved;
@property (nonatomic, copy) NSString *last_reply_at;
@property (nonatomic, assign) NSUInteger comment_count;
@property (nonatomic, assign) BOOL isLiked;
@property (nonatomic, copy) NSString *last_commented_at;

@end



NS_ASSUME_NONNULL_END
