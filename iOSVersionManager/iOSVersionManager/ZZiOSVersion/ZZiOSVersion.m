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
    
    NSMutableArray *v1Array = [NSMutableArray arrayWithArray:[[v1 componentsSeparatedByString:@"."] filteredArrayUsingPredicate:predicate]];
    NSMutableArray *v2Array = [NSMutableArray arrayWithArray:[[v2 componentsSeparatedByString:@"."] filteredArrayUsingPredicate:predicate]];
    
    NSUInteger length = MAX(v1Array.count, v2Array.count);
    [self fillArrayWithZero:v1Array maxLength:length];
    [self fillArrayWithZero:v2Array maxLength:length];
    
    for (NSUInteger i = 0; i < MIN(v1Array.count, v2Array.count); i++) {
        NSInteger v1Num = [v1Array[i] integerValue];
        NSInteger v2Num = [v2Array[i] integerValue];
        if (v1Num == v2Num) continue;
        return v1Num > v2Num ? NSOrderedDescending : NSOrderedAscending;
    }
    return NSOrderedSame;
}

+ (void)fillArrayWithZero:(NSMutableArray *)array maxLength:(NSUInteger)length {
    for (NSUInteger i = array.count; i < length; i++) {
        [array addObject:@"0"];
    }
}

@end
