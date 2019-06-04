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

## 8.3 可变性

## 8.4 集合家族

## 8.5 各种数值
