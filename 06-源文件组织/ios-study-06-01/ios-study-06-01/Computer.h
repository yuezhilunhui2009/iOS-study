//
//  Computer.h
//  ios-study-06-01
//
//  Created by roryluo-mb on 2019/6/4.
//  Copyright © 2019 ios-study. All rights reserved.
//

#import <Foundation/Foundation.h>
// 使用 @class 指令后无需 #import 其他头文件
//#import "Cpu.h"
//#import "Memery.h"
//#import "Computer.h"

NS_ASSUME_NONNULL_BEGIN

@class Cpu;
@class Memery;
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

NS_ASSUME_NONNULL_END
