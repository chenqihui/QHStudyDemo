//
//  SectionTwoViewController.m
//  QHStudyDemo
//
//  Created by Anakin chen on 2018/4/7.
//  Copyright © 2018年 Chen Network Technology. All rights reserved.
//

#import "SectionTwoViewController.h"

#import "Person.h"

@interface SectionTwoViewController ()

@end

@implementation SectionTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Person *p = [[Person alloc] init];
//    [p say:@"hello"];
//
//    [p performSelector:@selector(bye)];
    
    [p performSelector:@selector(eat)];
//    [p performSelector:@selector(eat2:when:) withObject:@"1" withObject:@"2"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
