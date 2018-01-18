//
//  ZZiOSVersion.m
//  iOSVersionManager
//
//  Created by liuweizhen on 2017/11/11.
//  Copyright © 2017年 liuxing8807@126.com. All rights reserved.
//

#import "ZZiOSVersion.h"
@import UIKit;

@implementation ZZiOSVersion

/**
+ (BOOL (^)(NSInteger))versionAvailable {
    return ^BOOL(NSInteger versionNumber) {
        NSString *version = [[UIDevice currentDevice] systemVersion];
        NSArray *components = [version componentsSeparatedByString:@"."];
        NSInteger value = 0;
        for (NSInteger i = 0; i < components.count; i++) {
            NSInteger numValue       = [components[i] integerValue];
            NSInteger multiValue     = (NSInteger)pow(10, (4-2*i)); // 10的4-2*i次方
            NSInteger componentValue = numValue * multiValue;
            value += componentValue;
        }
        // NSLog(@"%ld", value);
        return value >= versionNumber;
    };
}*/

+ (BOOL)versionAvailabel:(NSInteger)versionNumber {
    NSString *version = [[UIDevice currentDevice] systemVersion];
    NSArray *components = [version componentsSeparatedByString:@"."];
    NSInteger value = 0;
    for (NSInteger i = 0; i < components.count; i++) {
        NSInteger numValue       = [components[i] integerValue];
        NSInteger multiValue     = (NSInteger)pow(10, (4-2*i)); // 10的4-2*i次方
        NSInteger componentValue = numValue * multiValue;
        value += componentValue;
    }
    return value >= versionNumber;
}

+ (NSComparisonResult)versionCompare:(NSString *)v1 v2:(NSString *)v2 {
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return evaluatedObject.length > 0; // Just filter such as 1..2...3 to 1.2.3
    }];
    NSArray *v1Array = [[v1 componentsSeparatedByString:@"."] filteredArrayUsingPredicate:predicate];
    NSArray *v2Array = [[v2 componentsSeparatedByString:@"."] filteredArrayUsingPredicate:predicate];
    
    for (NSUInteger i = 0; i < MIN(v1Array.count, v2Array.count); i++) {
        NSInteger v1Num = [v1Array[i] integerValue];
        NSInteger v2Num = [v2Array[i] integerValue];
        if (v1Num == v2Num) continue;
        return v1Num > v2Num ? NSOrderedDescending : NSOrderedAscending;
    }
    
    if (v1Array.count > v2Array.count) {
        return NSOrderedDescending;
    } else if (v1Array.count == v2Array.count) {
        return NSOrderedSame;
    } else {
        return NSOrderedAscending;
    }
}

+ (NSComparisonResult (^)(NSString *version1, NSString *version2))versionCompare {
    return ^NSComparisonResult(NSString *v1, NSString *v2) {
        return NSOrderedAscending;
    };
}

@end
