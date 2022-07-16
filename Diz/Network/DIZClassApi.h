//
//  DIZClassApi.h
//  Diz
//
//  Created by Deniffer on 2022/7/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DIZNetworkCallbackBlock)(id _Nullable responseObject ,NSError * _Nullable error);

@interface DIZClassApi : NSObject

- (void)getCourses:(DIZNetworkCallbackBlock)callback;
- (void)getTargetCourseDetails:(NSUInteger)courseId callback:(DIZNetworkCallbackBlock)callback;
- (void)deleteCourseWithCourseId:(NSUInteger)courseId callback:(DIZNetworkCallbackBlock)callback;

@end

NS_ASSUME_NONNULL_END
