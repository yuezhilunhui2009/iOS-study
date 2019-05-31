# 第五章 复合
类之间的关系除了继承，也可以使用复合来表达。

## 5.1 什么是复合
在 OC 中复合就是将其他类的实例变量指针组合起来形成一个新的类的方式。继承是 `is a`（是一个...实例），复合是 `has a`（具有一个...）。

* Circle 继承自 Shape，可以说 Circle 是一个 Shape
* Computer 由 Cpu、Memery 组成，可以说 Computer 具有 Cpu、Memery，但不能说 Computer 是 Cpu、Memery

以上例子简单说明了继承和复合的区别。

### 5.1.1 Computer 程序
下面我们用 Computer 的例子来讲解，Computer 包含一个 Cpu 插槽和两个 Memery 插槽，在程序入口处实例化了一台计算机，由于内存太小玩吃鸡不流畅，所以换了一根 16GB 的内存条插在第二个插槽内。最后开机，计算机开始打印自检日志，把自己的零件信息打印了出来。

代码 ios-study-05-01：
```Objective-C
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

- (void) setCpu: (Cpu *) cpu;

- (void) setMemery: (Memery *) memery atIndex: (int) index;

- (void) run;

@end

@implementation Computer
- (id) init
{
    // 计算机出厂配置
    // if 内的内容后面章节会详细说明
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

- (void)setCpu:(Cpu *) _cpu
{
    cpu = _cpu;
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
    
    return 0;
}
```

### 5.1.2 自定义 NSLog()
使用 `NSLog(@"%@", instance)` 时，字符串内的 `%@` 会显示 `instance` 信息，并且会调用 `instance` 的 `description` 方法，将此方法返回的 NSString 展示出来。

## 5.2 存取方法
代码 ios-study-05-01 中的 Computer 买来时就有固定的配置，就像品牌机，有没有办法改成组装机，从一开始就满足用户对配置的要求？使用存取方法（accessor method），代码中的 `setMemery` `setCpu` 就属于 `setter` 方法，还有另一种用于读取数据的方法叫 `getter` 方法。存取方法的目的是为了间接操作实例的变量，增加一个中间层，有助于提高代码灵活性。

> 提示：iOS 开发时通常将 setter 命名为 `setXXX`，而将 getter 直接命名为 `XXX`，其中 `XXX` 是实例变量名字。

给计算机添加 getter 的示例：
```Objective-C
@implementation Computer
// ... 省略部分代码

- (Cpu *) cpu
{
    return cpu;
};

- (void)setCpu:(Cpu *) _cpu
{
    cpu = _cpu;
}

- (Memery *) memeryAtIndex: (int) index
{
    return memery[index];
};

- (void)setMemery: (Memery *) _memery atIndex: (int) index
{
    memery[index] = _memery;
}

@end
```