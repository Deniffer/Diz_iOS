//
//  DIZNetworkManager.m
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//

#import "DIZNetworkManager.h"
#import <AFNetworking/AFNetworking.h>

BOOL NEED_DEBUG = YES;
static NSString *MOCKLOGIN = @"?mock_login=123";

@interface DIZNetworkManager()

@property (nonatomic, copy) NSURL *baseUrl;
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation DIZNetworkManager

- (instancetype)initWithBaseUrl:(NSURL *)baseUrl {
    if (self = [super init]) {
        self.baseUrl = baseUrl;
    }
    return self;
}

- (NSString *)addMockLoginIfNeeded:(NSString *)URLString {
    if (NEED_DEBUG) {
        return [URLString stringByAppendingString:MOCKLOGIN];
    }
    return URLString;
}

- (void)GET:(NSString *)URLString params:(nullable NSDictionary *)params callback:(DIZNetworkCallbackBlock)callback {
    URLString = [self addMockLoginIfNeeded:URLString];
    [self.manager GET:URLString parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            !callback ?: callback(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            !callback ?: callback(nil, error);
    }];
}

- (void)POST:(NSString *)URLString params:(nullable NSDictionary *)params callback:(DIZNetworkCallbackBlock)callback {
    URLString = [self addMockLoginIfNeeded:URLString];
    [self.manager POST:URLString parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        !callback ?: callback(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !callback ?: callback(nil, error);
    }];
}

- (void)DELETE:(NSString *)URLString params:(nullable NSDictionary *)params callback:(DIZNetworkCallbackBlock)callback {
    URLString = [self addMockLoginIfNeeded:URLString];
    [self.manager DELETE:URLString parameters:params headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            !callback ?: callback(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            !callback ?: callback(nil, error);
    }];
}

- (void)PATCH:(NSString *)URLString params:(nullable NSDictionary *)params callback:(DIZNetworkCallbackBlock)callback {
    URLString = [self addMockLoginIfNeeded:URLString];
    [self.manager PATCH:URLString parameters:params headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            !callback ?: callback(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            !callback ?: callback(nil, error);
    }];
}

#pragma mark -- Getter

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:self.baseUrl];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return _manager;
}

@end
