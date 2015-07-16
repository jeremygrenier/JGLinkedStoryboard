//
//  UIStoryboardSegue+LinkedStoryboard.m
//  JGLinkedStoryboard
//
//  Created by Jeremy GRENIER on 21/11/2014.
//  Copyright (c) 2014 Jeremy Grenier. All rights reserved.
//

#import "UIStoryboardSegue+LinkedStoryboard.h"

#import <objc/runtime.h>

@implementation UIStoryboardSegue (LinkedStoryboard)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(initWithIdentifier:source:destination:);
        SEL swizzledSelector = @selector(xxx_initWithIdentifier:source:destination:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Internals

+ (UIViewController *)sceneNamed:(NSString *)identifier
{
    NSArray *info = [identifier componentsSeparatedByString:@"@"];
    NSArray *storyboardInfo = [info[1] componentsSeparatedByString:@":"];
    
    NSString *storyboard_name = storyboardInfo[0];
    NSString *scene_name = info[0];
    
    NSAssert(storyboard_name.length , @"LinkedStoryboard: storyboard name blank");

    SEL selector =  NSSelectorFromString(storyboard_name);
    IMP imp = [[UIStoryboard class] methodForSelector:selector];
    UIStoryboard *(*func)(id, SEL) = (void *)imp;
    
    UIStoryboard *storyboard;
    if ( [[UIStoryboard class] respondsToSelector:selector] ) {
        storyboard = func([UIStoryboard class], selector);
    }
    else {
        storyboard = [UIStoryboard storyboardWithName:storyboard_name bundle:nil];
    }
    
    UIViewController *scene = nil;
    if ( scene_name.length == 0 ) {
        scene = [storyboard instantiateInitialViewController];
    }
    else {
        scene = [storyboard instantiateViewControllerWithIdentifier:scene_name];
    }
    
    return scene;
}

#pragma mark - Method Swizzling

- (id)xxx_initWithIdentifier:(NSString *)identifier
                      source:(UIViewController *)source
                 destination:(UIViewController *)destination
{
    BOOL intraSegue = ( identifier && [identifier rangeOfString:@"@"].location != NSNotFound );

    destination = ( intraSegue ) ? [UIStoryboardSegue sceneNamed:identifier] : destination;
    
    return [self xxx_initWithIdentifier:identifier
                                 source:source
                            destination:destination];
}

@end
