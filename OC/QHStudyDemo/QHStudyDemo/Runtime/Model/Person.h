//
//  Person.h
//  QHStudyDemo
//
//  Created by Anakin chen on 2018/4/7.
//  Copyright © 2018年 Chen Network Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger age;

- (void)say:(NSString *)msg;

@end
