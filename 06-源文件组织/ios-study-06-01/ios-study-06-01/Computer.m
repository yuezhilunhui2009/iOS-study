//
//  Computer.m
//  ios-study-06-01
//
//  Created by roryluo-mb on 2019/6/4.
//  Copyright © 2019 ios-study. All rights reserved.
//

#import "Computer.h"
#import "Cpu.h"
#import "Memery.h"

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
