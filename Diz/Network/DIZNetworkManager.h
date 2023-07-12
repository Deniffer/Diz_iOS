//
//  DIZNetworkManager.h
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

typedef void(^DIZNetworkCallbackBlock)(id _Nullable responseObject ,NSError * _Nullable error);

/// 考虑对DIZNetworkManager 进行一层接口暴露， DIZNetworkManager 持有AFNetworkingManager,
/// 对外暴露接口 更加友好，以及api 只需要关心定位的资源 以及返回的形式
@interface DIZNetworkManager : NSObject

- (instancetype)initWithBaseUrl:(NSURL *)baseUrl;

- (void)GET:(NSString *)URLString params:(nullable NSDictionary *)params callback:(DIZNetworkCallbackBlock)callback;
- (void)POST:(NSString *)URLString params:(nullable NSDictionary *)params callback:(DIZNetworkCallbackBlock)callback;
- (void)DELETE:(NSString *)URLString params:(nullable NSDictionary *)params callback:(DIZNetworkCallbackBlock)callback;
- (void)PATCH:(NSString *)URLString params:(nullable NSDictionary *)params callback:(DIZNetworkCallbackBlock)callback;

@end

NS_ASSUME_NONNULL_END
