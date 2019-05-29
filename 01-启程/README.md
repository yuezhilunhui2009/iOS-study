# 第一章 启程

## 1.1 预备知识
* Objective-C 是 C 语言的扩展集（以后将 Objective-C 简称 OC）
* OC 对于 C 新增的部分主要是其面向对象的部分

## 1.2 历史
* 1983 年 Brad Cox 修改了 C 编译器，将 Smalltalk 的一些特性添加到其中，OC 就是在此基础上产生的
* 1985 年被赶出苹果公司的史蒂芬·乔布斯创立了 NeXT 公司，NeXT 公司选择了 OC
* NeXT 公司在 Unix 平台基于 OC 开发了 NextSTEP 工具包
* 1996 年苹果收购了 NextSTEP，同时 NextSTEP 更名为 Cocoa
* 时至今日，Cocoa 包含了后面我们将要学习的 Foundation、AppKit
* Cocoa Touch 包含了 UIKit 工具包

## 1.3 主要学习内容
由于 AppKit 是 OS X 的开发框架，UIKit 是 iOS 的开发框架，所以后面重点学习 UIKit。
* OC —— 开发语言
* Foundation —— iOS 开发工具包，主要提供 UI 无关的 API，API 的 “NS” 前缀来自此工具包以及 AppKit 工具包
* UIKit —— iOS 开发工具包，主要提供 UI 相关的 API，API 的 “UI” 前缀即来自于此工具包
* Xcode —— iOS 开发的 IDE