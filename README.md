# ZZiOSVersion
iOS版本判断



```objective-c
// 示例:

if ([ZZiOSVersion versionAvailabel:__IPHONE_7_0]) {
    NSLog(@"It's 7.0 or later version");
}

NSComparisonResult result = [ZZiOSVersion versionCompare:@"2.9.1.8" v2:@"2.9.10"];
```

