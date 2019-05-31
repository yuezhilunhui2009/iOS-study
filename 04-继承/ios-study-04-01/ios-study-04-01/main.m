//
//  main.m
//  ios-study-04-01
//
//  Created by roryluo-mb on 2019/5/31.
//  Copyright © 2019 ios-study. All rights reserved.
//

#import <Foundation/Foundation.h>

// ====================
// 定义数据结构
// ====================

// 定义形状
typedef enum {
    kCircle,
    kRectangle,
    kOblateSpheroid
} ShapeType;

// 定义颜色
typedef enum {
    kRedColor,
    kGreenColor,
    kBlueColor
} ShapeColor;

// 定义形状区域
typedef struct {
    int x, y, width, height;
} ShapeRect;

// ====================
// 函数声明
// ====================

void drawShapes (id shapes[], int count);
NSString *colorName (ShapeColor colorName);

// ====================
// 函数定义
// ====================

void drawShapes (id shapes[], int count) {
    for (int i = 0 ; i < count; i++) {
        id shape = shapes[i];
        [shape draw];
    }
}

NSString *colorName (ShapeColor colorName) {
    switch (colorName) {
        case kRedColor:
            return @"红";
            break;
        case kGreenColor:
            return @"绿";
            break;
        case kBlueColor:
            return @"蓝";
            break;
    }
}

// ====================
// 类声明
// ====================

@interface Shape : NSObject
{
    ShapeRect bounds;
    ShapeColor fillColor;
}

- (void) setBounds: (ShapeRect) bounds;

- (void) setFillColor: (ShapeColor) fillColor;

- (void) draw;

@end

@interface Circle : Shape
@end

@interface Rectangle : Shape
@end

@interface Egg : Shape
@end

// ====================
// 类实现
// ====================

@implementation Shape

- (void) setBounds: (ShapeRect) _bounds {
    bounds = _bounds;
};

- (void) setFillColor: (ShapeColor) _fillColor {
    fillColor = _fillColor;
};

- (void) draw {
    
}

@end

@implementation Circle

- (void) draw {
    NSLog(@"绘制一个 (%d %d %d %d) %@色的圆",
          bounds.x, bounds.y,
          bounds.width,bounds.height,
          colorName(fillColor));
}

@end

@implementation Rectangle

- (void) draw {
    NSLog(@"绘制一个 (%d %d %d %d) %@色的矩形",
          bounds.x, bounds.y,
          bounds.width, bounds.height,
          colorName(fillColor));
}

@end

@implementation Egg

- (void) draw {
    NSLog(@"绘制一个 (%d %d %d %d) %@色的椭圆",
          bounds.x, bounds.y,
          bounds.width, bounds.height,
          colorName(fillColor));
}

@end

// ====================
// 程序入口
// ====================

int main (int argc, const char *argv[]) {
    id shapes[3];
    
    // 红色圆形
    ShapeRect rect0 = { 0, 0, 10, 30 };
    shapes[0] = [Circle new];
    [shapes[0] setBounds: rect0];
    [shapes[0] setFillColor: kRedColor];
    
    // 绿色矩形
    ShapeRect rect1 = { 30, 40, 50, 60 };
    shapes[1] = [Rectangle new];
    [shapes[1] setBounds: rect1];
    [shapes[1] setFillColor: kGreenColor];
    
    // 蓝色椭圆
    ShapeRect rect2 = { 15, 25, 37, 30 };
    shapes[2] = [Egg new];
    [shapes[2] setBounds: rect2];
    [shapes[2] setFillColor: kBlueColor];
    
    drawShapes(shapes, 3);
    
    return 0;
}
