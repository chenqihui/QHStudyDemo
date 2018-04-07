//
//  SectionOneViewController.m
//  QHStudyDemo
//
//  Created by Anakin chen on 2018/4/7.
//  Copyright © 2018年 Chen Network Technology. All rights reserved.
//

#import "SectionOneViewController.h"

#import "Person.h"
#import <objc/message.h>


/*
 [iOS runtime探究(一): 从runtime开始理解面向对象的类到面向过程的结构体](https://www.jianshu.com/p/17e158a666b1)
 */

@interface SectionOneViewController ()

@end

@implementation SectionOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self partTwo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)partOne {
    Person *p = [[Person alloc] init];
    Class c1 = [p class];
    Class c2 = [Person class];
    //输出 1
    NSLog(@"%d", c1 == c2);
}

- (void)partTwo {Person *p = [[Person alloc] init];
    //输出1
    NSLog(@"%d", [p class] == object_getClass(p));
    //输出0
    NSLog(@"%d", class_isMetaClass(object_getClass(p)));
    //输出1
    NSLog(@"%d", class_isMetaClass(object_getClass([Person class])));
    //输出0
    NSLog(@"%d", object_getClass(p) == object_getClass([Person class]));
}

@end
