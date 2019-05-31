//
//  main.m
//  ios-study-05-01
//
//  Created by roryluo-mb on 2019/5/31.
//  Copyright © 2019 ios-study. All rights reserved.
//

#import <Foundation/Foundation.h>

// cpu 的定义以及实现
@interface Cpu : NSObject
{
    NSString *level;
}

- (void) setLevel: (NSString *) level;

@end

@implementation Cpu
- (void) setLevel: (NSString *) _level
{
    level = _level;
}

- (NSString *) description
{
    return level;
}
@end

// 内存的定义以及实现
@interface Memery : NSObject
{
    NSString *level;
}

- (void) setLevel: (NSString *) _level;
@end

@implementation Memery
- (void) setLevel: (NSString *) _level
{
    level = _level;
}

- (NSString *) description
{
    return level;
}
@end

// 计算机的定义以及实现
@interface Computer : NSObject
{
    Cpu *cpu;
    Memery *memery[2];
}

- (Cpu *) cpu;

- (void) setCpu: (Cpu *) cpu;

- (Memery *) memeryAtIndex: (int) index;

- (void) setMemery: (Memery *) memery atIndex: (int) index;

- (void) run;

@end

@implementation Computer
- (id) init
{
    if (self = [super init]) {
        cpu = [Cpu new];
        [cpu setLevel:@"英特尔酷睿 i7 8700k"];
        
        memery[0] = [Memery new];
        [memery[0] setLevel:@"紫光 DDR4 8GB"];
        
        memery[1] = [Memery new];
        [memery[1] setLevel:@"紫光 DDR4 8GB"];
    }
    
    return self;
}

- (Cpu *) cpu
{
    return cpu;
}

- (void) setCpu: (Cpu *) _cpu
{
    cpu = _cpu;
}

- (Memery *) memeryAtIndex: (int) index
{
    return memery[index];
}

- (void)setMemery: (Memery *) _memery atIndex: (int) index
{
    memery[index] = _memery;
}

- (void)run
{
    NSLog(@"\n计算机开机自检\ncpu：%@\n内存插槽1#：%@\n内存插槽2#：%@",
          cpu, memery[0], memery[1]);
}

@end

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
