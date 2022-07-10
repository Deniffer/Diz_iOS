//
//  DIZNetworkManager.m
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//

#import "DIZNetworkManager.h"

@interface DIZNetworkManager()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation DIZNetworkManager

- (instancetype)initWithBaseUrl:(NSURL *)baseUrl {
    if (self = [super init]) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseUrl];
    }
    return self;
}

- (void)GET:(NSString *)URLString params:(nullable NSDictionary *)params callback:(DIZNetworkCallbackBlock)callback {
    [self.manager GET:URLString parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            !callback ?: callback(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            !callback ?: callback(nil, error);
    }];
}

- (void)POST:(NSString *)URLString params:(nullable NSDictionary *)params callback:(DIZNetworkCallbackBlock)callback {
    [self.manager POST:URLString parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            !callback ?: callback(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            !callback ?: callback(nil, error);
    }];
}

- (void)DELETE:(NSString *)URLString params:(nullable NSDictionary *)params callback:(DIZNetworkCallbackBlock)callback {
    [self.manager DELETE:URLString parameters:params headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            !callback ?: callback(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            !callback ?: callback(nil, error);
    }];
}

- (void)PATCH:(NSString *)URLString params:(nullable NSDictionary *)params callback:(DIZNetworkCallbackBlock)callback {
    [self.manager PATCH:URLString parameters:params headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            !callback ?: callback(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            !callback ?: callback(nil, error);
    }];
}




@end
