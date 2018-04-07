//
//  Person.m
//  QHStudyDemo
//
//  Created by Anakin chen on 2018/4/7.
//  Copyright © 2018年 Chen Network Technology. All rights reserved.
//

#import "Person.h"

#import <objc/message.h>

#import "Tom.h"

@implementation Person

void dynamicAdditionMethodIMP(id self, SEL _cmd) {
    NSLog(@"dynamicAdditionMethodIMP");
}

void dynamicAdditionMethodIMP2(id self, SEL _cmd, NSString *a, NSString *t) {
    NSLog(@"dynamicAdditionMethodIMP->%@->%@", a, t);
}

- (void)say:(NSString *)msg {
    NSLog(@"%@", msg);
}

- (void)bye {
    [self say:@"bye"];
}

//动态方法解析

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"resolveInstanceMethod: %@", NSStringFromSelector(sel));
//    if (sel == @selector(eat2:when:)) {
//        class_addMethod([self class], sel, (IMP)dynamicAdditionMethodIMP2, "v@:@");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}

//重新转发

- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(eat)) {
//        return [[Tom alloc] init];
//    }
    return [super forwardingTargetForSelector:aSelector];
}

//重新签名

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel isEqualToString:@"eat"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

//消息重定向

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    //取消息
    SEL seletor = [anInvocation selector];
    
    Tom *tom = [Tom new];
    
    if ([tom respondsToSelector:seletor]) {
        [anInvocation invokeWithTarget:tom];
    }
    else {
        [super forwardInvocation:anInvocation];
    }
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"doesNotRecognizeSelector: %@", NSStringFromSelector(aSelector));
}

@end
