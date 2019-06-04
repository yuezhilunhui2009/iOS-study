//
//  main.m
//  ios-study-06-01
//
//  Created by roryluo-mb on 2019/6/4.
//  Copyright © 2019 ios-study. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cpu.h"
#import "Memery.h"
#import "Computer.h"

// 程序入口
int main(int argc, const char * argv[]) {
    Computer *computer = [Computer new];
    
    // 买了一根新的内存条
    Memery *weigangMemery = [Memery new];
    [weigangMemery setLevel:@"威刚 DDR4 16GB"];
    
    // 把第二个内存插槽的内存条替换掉
    [computer setMemery:weigangMemery atIndex:1];
    
    // 开机
    [computer run];
    
    // 检查第一个内存插槽的内存
    Memery *memery = [computer memeryAtIndex:0];
    NSLog(@"\n检查内存插槽1#：%@", memery);
    
    return 0;
}
