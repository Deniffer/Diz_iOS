//
//  DIZLogManager.m
//  Diz
//
//  Created by Deniffer on 7/6/23.
//

#import "DIZLogManager.h"
#import <UIKit/UIDevice.h>

#define DIZLogInfo(frmt, ...) do{ LogWrapper(0,(frmt), ##__VA_ARGS__); } while(0)
#define DIZLogWarn(frmt, ...) do{ LogWrapper(1,(frmt), ##__VA_ARGS__); } while(0)
#define DIZLogDebug(frmt, ...) do{ LogWrapper(2,(frmt), ##__VA_ARGS__); } while(0)
#define DIZLogError(frmt, ...) do{ LogWrapper(3,(frmt), ##__VA_ARGS__); } while(0)


FOUNDATION_EXTERN void LogWrapper(int log_level,NSString *format, ...);


void createUploadTask(NSData *data) {
    NSURL *URL = [NSURL URLWithString:@"http://10.95.63.121:10000"];
    NSMutableURLRequest *requset = [[NSMutableURLRequest alloc] initWithURL:URL];
    [requset setHTTPMethod:@"POST"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:requset fromData:data];
    [uploadTask resume];
}

void LogWrapper(int log_level,NSString *format, ...) {
    va_list args;
    va_start(args, format);

    // get current Date & Time
    NSDate* now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *currentTime = [formatter stringFromDate:now];
    [formatter setDateFormat:@"MM-dd"];
    NSString *currentDate = [formatter stringFromDate:now];
    // define msg & filelocation
    NSString *msg = [[NSString alloc] initWithFormat:[NSString stringWithFormat:@"%@",format] arguments:args];
    NSString *deviceName = [[UIDevice currentDevice] name] ?: @"default";
    NSString *writeStr = [NSString stringWithFormat:@"[%@][%@][%@] :%@",deviceName,currentDate,currentTime,msg];
    NSDictionary *jsonDict = @{
        @"log_level" : @(log_level),
        @"msg" : writeStr,
        @"source" : deviceName
    };
    NSData *data = [NSJSONSerialization dataWithJSONObject:jsonDict options:0 error:nil];
    createUploadTask(data);
    NSLog(@"%@", writeStr);
    va_end(args);
}

@implementation DIZLogManager

@end
