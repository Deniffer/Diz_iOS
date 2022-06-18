//
//  DIZUserModel.h
//  Diz
//
//  Created by Deniffer on 2022/6/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DIZUserModel : NSObject

@property (nonatomic, assign) NSUInteger uid;
@property (nonatomic, copy) NSString *avatarUrl;
@property (nonatomic, copy) NSString *nickName;

@end

@interface DIZClassModel : NSObject

@property (nonatomic, assign) NSUInteger classId;
@property (nonatomic, assign) NSInteger duration;  // class duration, if duration == -1  means long term
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *begin_at;
@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, copy) NSString *invite_code;
@property (nonatomic, strong) NSMutableArray<DIZUserModel *> *members;

@end

@interface DIZClassDirectories : NSObject

@property (nonatomic, assign) NSUInteger directory_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *postArray;

//@property (nonatomic, assign)

@end

typedef NS_ENUM(NSUInteger,DIZClassPostType) {
    DIZClassPostTypeNote,
    DIZClassPostTypeQuestion
};

@interface DIZClassComment : NSObject

@property (nonatomic, assign) NSUInteger commentId;
@property (nonatomic, assign) NSUInteger owner;
@property (nonatomic, assign) NSUInteger likeCount;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *date;

@end

@interface DIZClassPost : NSObject

@property (nonatomic, assign) DIZClassPostType type;
@property (nonatomic, assign) NSUInteger owner;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *abstractContent;
@property (nonatomic, strong) NSMutableDictionary *commentArray;
@property (nonatomic, assign) BOOL isSolved;
@property (nonatomic, assign) BOOL isLocked;
@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, copy) NSString *lastEditDate;

@end




NS_ASSUME_NONNULL_END
