//
//  ViewController.m
//  iOSVersionManager
//
//  Created by liuweizhen on 2017/10/12.
//  Copyright © 2017年 liuxing8807@126.com. All rights reserved.
//

#import "ViewController.h"
#import "ZZiOSVersion.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([ZZiOSVersion versionAvailabel:__IPHONE_7_0]) {
        NSLog(@"It's 7.0 or later version");
    }
    
    NSString *v1 = @"2.9.1.8";
    NSString *v2 = @"2.9.10";
    NSComparisonResult result = [ZZiOSVersion versionCompare:v1 v2:v2];
    switch (result) {
        case NSOrderedAscending: {
            NSLog(@"%@", [NSString stringWithFormat:@"%@ < %@", v1, v2]);
            break;
        }
        case NSOrderedSame: {
            NSLog(@"%@", [NSString stringWithFormat:@"%@ = %@", v1, v2]);
            break;
        }
        case NSOrderedDescending: {
            NSLog(@"%@", [NSString stringWithFormat:@"%@ > %@", v1, v2]);
            break;
        }
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
