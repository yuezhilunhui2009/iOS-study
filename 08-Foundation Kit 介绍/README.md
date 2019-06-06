# 第八章 Foundation Kit 介绍

## 8.1 一些有用的数据类型
### 8.1.1 范围的作用
`NSRange` 结构体：
```Objective-C
typedef struct _NSRange {
    unsigned int location;
    unsigned int length;
} NSRange;
```

功能：
* 表示范围
* 字符串的范围操作，很多 API 会用到此结构体表示作用范围
* 数组的范围操作，很多 API 会用到此结构体表示作用范围

初始化（代码 ios-study-08-01）：
```Objective-C
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // ===================
        // NSRange 结构体
        // ===================
        
        // 创建方式1：直接给字段赋值
        NSRange range1;
        range1.location = 0;
        range1.length = 5;
        NSLog(@"range1 => %@", NSStringFromRange(range1));
        
        // 创建方式2：聚合结构赋值
        NSRange range2 = { 0, 5 };
        NSLog(@"range2 => %@", NSStringFromRange(range2));
        
        // 创建方式3：工具函数
        NSRange range3 = NSMakeRange(0, 5);
        NSLog(@"range3 => %@", NSStringFromRange(range3));
    }
    return 0;
}
```

程序运行输出：
```
2019-06-05 00:32:13.409924+0800 ios-study-08-01[25129:20382276] range1 => {0, 5}
2019-06-05 00:32:13.410084+0800 ios-study-08-01[25129:20382276] range2 => {0, 5}
2019-06-05 00:32:13.410105+0800 ios-study-08-01[25129:20382276] range3 => {0, 5}
```

### 8.1.2 几何数据类型
表示笛卡尔平面中点的 `NSPoint` 结构体：
```Objective-C
typedef struct _NSPoint {
    float x;
    float y;
} NSPoint;
```

表示宽高的 `NSSize` 结构体：
```Objective-C
typedef struct _NSSize {
    float width;
    float height;
} NSSize;
```

表示矩形的 `NSRect` 结构体：
```Objective-C
typedef struct _NSRect {
    NSPoint origin;
    NSSize size;
} NSRect;
```

> 可以使用 `NSMakePoint()`，`NSMakeSize()`，`NSMakeRect()` 快速创建以上的数据结构。

> 为什么这些数据使用结构体而不是对象来定义？还是为了高性能。因为 GUI 程序中有大量的临时点、尺寸等变量，OC 的对象是动态分配的，这是一个代价较高的操作，所以使用 C 的 struct 性能会好很多。

初始化（代码 ios-study-08-01）：
```Objective-C
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // ===================
        // NSPoint 结构体
        // ===================
        NSPoint point1;
        point1.x = 3;
        point1.y = 4;
        NSLog(@"point1 => %@", NSStringFromPoint(point1));
        
        NSPoint point2 = { 3, 4 };
        NSLog(@"point2 => %@", NSStringFromPoint(point2));
        
        NSPoint point3 = NSMakePoint(3, 4);
        NSLog(@"point3 => %@", NSStringFromPoint(point3));
        
        // ===================
        // NSSize 结构体
        // ===================
        NSSize size1;
        size1.width = 10;
        size1.height = 20;
        NSLog(@"size1 => %@", NSStringFromSize(size1));
        
        NSSize size2 = { 10, 20 };
        NSLog(@"size2 => %@", NSStringFromSize(size2));
        
        NSSize size3 = NSMakeSize(10, 20);
        NSLog(@"size3 => %@", NSStringFromSize(size3));

        // ===================
        // NSRect 结构体
        // ===================
        NSRect rect1;
        rect1.origin = point1;
        rect1.size = size1;
        NSLog(@"rect1 => %@", NSStringFromRect(rect1));
        
        NSRect rect2 = { point1, size1 };
        NSLog(@"rect2 => %@", NSStringFromRect(rect2));
        
        NSRect rect3 = NSMakeRect(point1.x, point1.y, size1.width, size1.height);
        NSLog(@"rect3 => %@", NSStringFromRect(rect3));
    }
    return 0;
}
```

程序运行输出：
```
2019-06-05 00:37:48.603562+0800 ios-study-08-01[26349:20387849] point1 => {3, 4}
2019-06-05 00:37:48.603574+0800 ios-study-08-01[26349:20387849] point2 => {3, 4}
2019-06-05 00:37:48.603584+0800 ios-study-08-01[26349:20387849] point3 => {3, 4}
2019-06-05 00:37:48.603608+0800 ios-study-08-01[26349:20387849] size1 => {10, 20}
2019-06-05 00:37:48.603627+0800 ios-study-08-01[26349:20387849] size2 => {10, 20}
2019-06-05 00:37:48.603637+0800 ios-study-08-01[26349:20387849] size3 => {10, 20}
2019-06-05 00:37:48.603649+0800 ios-study-08-01[26349:20387849] rect1 => {{3, 4}, {10, 20}}
2019-06-05 00:37:48.603660+0800 ios-study-08-01[26349:20387849] rect2 => {{3, 4}, {10, 20}}
2019-06-05 00:37:48.603670+0800 ios-study-08-01[26349:20387849] rect3 => {{3, 4}, {10, 20}}
```

## 8.2 字符串
### 8.2.1 创建字符串
使用 `NSString` 的 `stringWithFormat` 方法创建格式化字符串，方法签名：
`+ (id) stringWithFormat: (NSString *) format, ...;`

代码 ios-study-08-02：
```Objective-C
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // ===================
        // 使用 stringWithFormat 创建字符串
        // ===================
        NSString *str;
        str = [NSString stringWithFormat: @"北京今天的天气晴朗，温度 %d ~ %d 摄氏度", 24, 32];
        NSLog(@"%@", str);
    }
    return 0;
}
```

程序运行输出：
```
2019-06-06 14:23:44.796761+0800 ios-study-08-02[52395:20514398] 北京今天的天气晴朗，温度 24 ~ 32 摄氏度
```

### 8.2.2 类方法
`+ (id) stringWithFormat: (NSString *) format, ...;` 的加号代表此方法为类方法（有的语言叫做静态方法），后面的点点点代表可以传入多个参数。

### 8.2.3 关于大小
`NSString` 实例的 `length` 方法可以返回字符串长度，它可以处理多种语言例如英文、中文、俄文甚至 unicode 编码的字符串等等。

代码 ios-study-08-02：
```Objective-C
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // ===================
        // 计算字符串长度
        // ===================
        NSString *strChinese;
        strChinese = [NSString stringWithFormat: @"中文字符串"];
        NSLog(@"strChinese 字符串长度 => %lul", [strChinese length]);
        
        NSString *strEnglish;
        strEnglish = [NSString stringWithFormat: @"english string"];
        NSLog(@"strEnglish 字符串长度 => %lul", [strEnglish length]);
    }
    return 0;
}
```

程序运行输出：
```
2019-06-06 14:32:23.610741+0800 ios-study-08-02[54232:20523532] strChinese 字符串长度 => 5l
2019-06-06 14:32:23.610755+0800 ios-study-08-02[54232:20523532] strEnglish 字符串长度 => 14l
```

### 8.2.4 比较的策略
`NSString` 实例的 `isEqualToString` 方法用来比较自身和传入字符串是否相等（用 `==` 来比较两个字符串的指针是否相等的方式对比字符串是否相等是错误的），方法签名：
`- (BOOL) isEqualToString: (NSString *) aString;`

`NSString` 实例的 `compare` 方法用来逐个字符比较两个字符串大小，返回结果是 `NSComparisonResult` 枚举：
```Objective-C
// 比较结果枚举：
typedef enum _NSComparisonResult {
    NSOrderedAscending = -1;
    NSOrderedSame,
    NSOrderedDescending
} NSComparisonResult;
```

代码 ios-study-08-02：
```Objective-C
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // ===================
        // 比较字符串是否相等
        // ===================
        NSString *str1 = @"用于比较的字符串";
        NSString *str2 = @"用于比较的字符串";
        NSString *str3;
        str3 = [NSString stringWithFormat: @"用于比较的字符串"];

        NSLog(@"str1 和 str2 指针是否相等 => %d", str1 == str2);
        NSLog(@"str2 和 str3 指针是否相等 => %d", str2 == str3);
        NSLog(@"str1 和 str1 内容是否相等 => %hhd", [str1 isEqualToString: str2]);
        NSLog(@"str2 和 str3 内容是否相等 => %hhd", [str2 isEqualToString: str3]);

        // ===================
        // 比较字符串大小
        // ===================
        NSString *str4 = @"111";
        NSString *str5 = @"222";
        NSString *str6 = @"222";
        
        NSLog(@"str4 compare str5 => %ld", (long)[str4 compare: str5]);
        NSLog(@"str5 compare str6 => %ld", (long)[str5 compare: str6]);
        NSLog(@"str6 compare str4 => %ld", (long)[str6 compare: str4]);
    }
    return 0;
}
```

程序运行输出：
```
2019-06-06 15:21:40.900828+0800 ios-study-08-02[63663:20571793] str1 和 str2 指针是否相等 => 1
2019-06-06 15:21:40.900837+0800 ios-study-08-02[63663:20571793] str2 和 str3 指针是否相等 => 0
2019-06-06 15:21:40.900847+0800 ios-study-08-02[63663:20571793] str1 和 str1 内容是否相等 => 1
2019-06-06 15:21:40.900863+0800 ios-study-08-02[63663:20571793] str2 和 str3 内容是否相等 => 1

2019-06-06 15:21:40.900874+0800 ios-study-08-02[63663:20571793] str4 compare str5 => -1
2019-06-06 15:21:40.900883+0800 ios-study-08-02[63663:20571793] str5 compare str6 => 0
2019-06-06 15:21:40.900890+0800 ios-study-08-02[63663:20571793] str6 compare str4 => 1
```

### 8.2.5 不区分大小写的比较
`compare:` 是区分大小写的比较，还有一个不区分大小写的比较方法 `compare: options:`，方法签名：
`- (NSComparisonResult) compare: (NSString *) string options: (unsigned) mask;`。

`options` 是位掩码，可以使用位或（`|`）来添加选项标记，常用的选项：
```
NSCaseInsensitiveSearch: 不区分大小写字符
NSLiteralSearch: 进行完全比较，区分大小写
NSNumbericSearch: 比较字符串字符个数
```

代码 ios-study-08-02：
```Objective-C
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // ===================
        // 比较字符串大小（忽略大小写）
        // ===================
        NSString *str7 = @"ABC";
        NSString *str8 = @"abc";
        
        NSLog(@"str7 compare str8 忽略大小写 => %ld", [str7 compare: str8 options: NSCaseInsensitiveSearch]);
        NSLog(@"str7 compare str8 区分大小写 => %ld", [str7 compare: str8 options: NSLiteralSearch]);
    }
    return 0;
}
```

程序运行输出：
```
2019-06-06 16:13:35.205982+0800 ios-study-08-02[73855:20621281] str7 compare str8 忽略大小写 => 0
2019-06-06 16:13:35.205994+0800 ios-study-08-02[73855:20621281] str7 compare str8 区分大小写 => -1
```

### 8.2.6 字符串内是否还包含别的字符串
```Objective-C
// 判断是否为字符串开头
- (BOOL) hasPrefix: (NSString *) aString;

// 判断是否为字符串结尾
- (BOOL) hasSuffix: (NSString *) aString;

// 返回传入字符串在当前字符串中的范围
- (NSRange) rangeOfString: (NSString *) aString;
```

## 8.3 可变性

## 8.4 集合家族

## 8.5 各种数值
