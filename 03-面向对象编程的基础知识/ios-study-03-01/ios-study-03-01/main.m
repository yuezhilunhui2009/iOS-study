//
//  main.m
//  ios-study-03-01
//
//  Created by roryluo-mb on 2019/5/30.
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

// 定义图形
typedef struct {
    ShapeType type;
    ShapeColor fillColor;
    ShapeRect bounds;
} Shape;

// ====================
// 函数声明
// ====================

void drawShapes (Shape shapes[], int count);
void drawCircle (ShapeRect bounds, ShapeColor fillColor);
void drawRectangle (ShapeRect bounds, ShapeColor fillColor);
void drawEgg (ShapeRect bounds, ShapeColor fillColor);
NSString *colorName (ShapeColor colorName);

// ====================
// 函数定义
// ====================

void drawShapes (Shape shapes[], int count) {
    int i;
    
    for (i = 0; i < count; i++) {
        switch (shapes[i].type) {
            case kCircle:
                drawCircle(shapes[i].bounds, shapes[i].fillColor);
                break;
            case kRectangle:
                drawRectangle(shapes[i].bounds, shapes[i].fillColor);
                break;
            case kOblateSpheroid:
                drawEgg(shapes[i].bounds, shapes[i].fillColor);
        }
    }
}

void drawCircle (ShapeRect bounds, ShapeColor fillColor) {
    NSLog(@"绘制一个 (%d %d %d %d) %@色的圆",
          bounds.x, bounds.y,
          bounds.width, bounds.height,
          colorName(fillColor));
}

void drawRectangle (ShapeRect bounds, ShapeColor fillColor) {
    NSLog(@"绘制一个 (%d %d %d %d) %@色的矩形",
          bounds.x, bounds.y,
          bounds.width, bounds.height,
          colorName(fillColor));
}

void drawEgg (ShapeRect bounds, ShapeColor fillColor) {
    NSLog(@"绘制一个 (%d %d %d %d) %@色的椭圆",
          bounds.x, bounds.y,
          bounds.width, bounds.height,
          colorName(fillColor));
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
// 程序入口
// ====================

int main (int argc, const char *argv[]) {
    Shape shapes[3];
    
    // 红色圆形
    ShapeRect rect0 = { 0, 0, 10, 30 };
    shapes[0].type = kCircle;
    shapes[0].fillColor = kRedColor;
    shapes[0].bounds = rect0;
    
    // 绿色矩形
    ShapeRect rect1 = { 30, 40, 50, 60 };
    shapes[1].type = kRectangle;
    shapes[1].fillColor = kGreenColor;
    shapes[1].bounds = rect1;
    
    // 蓝色椭圆
    ShapeRect rect2 = { 15, 25, 37, 30 };
    shapes[2].type = kOblateSpheroid;
    shapes[2].fillColor = kBlueColor;
    shapes[2].bounds = rect2;
    
    drawShapes(shapes, 3);
    
    return 0;
}
