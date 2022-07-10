//
//  DIZClassViewModel.m
//  Diz
//
//  Created by Deniffer on 2022/7/10.
//

#import "DIZClassViewModel.h"
#import "DIZClassApi.h"
#import "DIZUserModel.h"

@interface DIZClassViewModel ()

//@property (nonatomic, copy) NSArray<>
@property (nonatomic, strong) DIZClassApi *api;

@end

@implementation DIZClassViewModel

- (instancetype)init {
    if (self = [super init]) {
        _api = [[DIZClassApi alloc] init];
        [self getFullCourses];
    }
    return self;
}


- (void)getFullCourses {
    [self.api getCourseList:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error!");
            // show newtork error toast
            return;
        }
        NSLog(@"%@",responseObject);
    }];
}

@end
