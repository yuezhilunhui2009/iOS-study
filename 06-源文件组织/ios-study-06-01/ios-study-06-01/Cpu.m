//
//  Cpu.m
//  ios-study-06-01
//
//  Created by roryluo-mb on 2019/6/4.
//  Copyright © 2019 ios-study. All rights reserved.
//

#import "Cpu.h"

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
