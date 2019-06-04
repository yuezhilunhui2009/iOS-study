//
//  main.m
//  ios-study-08-01
//
//  Created by roryluo-mb on 2019/6/4.
//  Copyright © 2019 ios-study. All rights reserved.
//

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
