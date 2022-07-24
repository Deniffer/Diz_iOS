//
//  DIZNetworkManager.m
//  Diz
//
//  Created by Deniffer on 2022/6/25.
//

#import "DIZNetworkManager.h"

BOOL NEED_DEBUG = YES;
NSString *MOCKLOGIN = @"?mock_login=123";

@interface DIZNetworkManager()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation DIZNetworkManager

- (instancetype)initWithBaseUrl:(NSURL *)baseUrl {
    if (self = [super init]) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseUrl];
        AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
        //[serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        //[serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        _manager.requestSerializer = serializer;
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
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
//    [self.manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [self.manager POST:URLString parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            !callback ?: callback(responseObject, nil);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            !callback ?: callback(nil, error);
//    }];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:URLString relativeToURL:self.manager.baseURL]];
//    request.HTTPMethod = @"POST";
//    request = [[AFJSONRequestSerializer serializer] requestBySerializingRequest:request withParameters:params error:nil];
//    NSURLSessionDataTask *dataTask = nil;
//    dataTask = [self.manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        !callback ?: callback(responseObject, error);
//    }];
//    [dataTask resume];
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

@end
