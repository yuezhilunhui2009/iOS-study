//
//  main.m
//  ios-study-08-02
//
//  Created by roryluo-mb on 2019/6/5.
//  Copyright © 2019 ios-study. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // ===================
        // 创建格式化字符串
        // ===================
        NSString *str;
        str = [NSString stringWithFormat: @"北京今天的天气晴朗，温度 %d ~ %d 摄氏度", 24, 32];
        NSLog(@"%@", str);
        
        // ===================
        // 计算字符串长度
        // ===================
        NSString *strChinese;
        strChinese = [NSString stringWithFormat: @"中文字符串"];
        NSLog(@"strChinese 字符串长度 => %lul", [strChinese length]);
        
        NSString *strEnglish;
        strEnglish = [NSString stringWithFormat: @"english string"];
        NSLog(@"strEnglish 字符串长度 => %lul", [strEnglish length]);
        
        // ===================
        // 比较字符串是否相等
        // ===================
        NSString *str1 = @"用于比较的字符串";
        NSString *str2 = @"用于比较的字符串";
        NSString *str3;
        str3 = [NSString stringWithFormat: @"用于比较的字符串"];

        NSLog(@"str1 和 str2 指针是否相等 => %d", str1 == str2);
        NSLog(@"str2 和 str3 指针是否相等 => %d", str2 == str3);
        NSLog(@"str1 和 str1 内容是否相等 => %hhd", [str1 isEqualToString: str2]);
        NSLog(@"str2 和 str3 内容是否相等 => %hhd", [str2 isEqualToString: str3]);
        
        // ===================
        // 比较字符串大小
        // ===================
        NSString *str4 = @"111";
        NSString *str5 = @"222";
        NSString *str6 = @"222";
        
        NSLog(@"str4 compare str5 => %ld", (long)[str4 compare: str5]);
        NSLog(@"str5 compare str6 => %ld", (long)[str5 compare: str6]);
        NSLog(@"str6 compare str4 => %ld", (long)[str6 compare: str4]);
        
        // ===================
        // 比较字符串大小（忽略大小写）
        // ===================
        NSString *str7 = @"ABC";
        NSString *str8 = @"abc";
        
        NSLog(@"str7 compare str8 忽略大小写 => %ld", [str7 compare: str8 options: NSCaseInsensitiveSearch]);
        NSLog(@"str7 compare str8 区分大小写 => %ld", [str7 compare: str8 options: NSLiteralSearch]);
        
        // ===================
        // 判断
        // ===================
    }
    return 0;
}
