//
//  ZZiOSVersion.h
//  iOSVersionManager
//
//  Created by liuweizhen on 2017/11/11.
//  Copyright © 2017年 liuxing8807@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZiOSVersion : NSObject

// + (BOOL (^)(NSInteger))versionAvailable;

/**
 版本判断
 
 @param versionNumber 版本号 - 整型
 @return 是否版本可用
 */
+ (BOOL)versionAvailabel:(NSInteger)versionNumber;

/**
 版本对比

 @param v1 版本1
 @param v2 版本2
 @return NSComparisonResult
 version1 > version2 ==> NSOrderedDescending
 version1 = version2 ==> NSOrderedSame
 version1 < version2 ==> NSOrderedAscending
 */
+ (NSComparisonResult)versionCompare:(NSString *)v1 v2:(NSString *)v2;

@end
