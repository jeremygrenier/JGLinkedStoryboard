//
//  UIStoryboard+JGLinkedStoryboardDemo.m
//  JGLinkedStoryboard
//
//  Created by Jeremy GRENIER on 21/11/2014.
//  Copyright (c) 2014 Jeremy Grenier. All rights reserved.
//

#import "UIStoryboard+JGLinkedStoryboardDemo.h"

@implementation UIStoryboard (JGLinkedStoryboardDemo)

#pragma mark - Global

+ (instancetype)storyboardWithName:(NSString *)name
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *storyboardName = name ?: [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
    return [UIStoryboard storyboardWithName:storyboardName bundle:bundle];
}

#pragma mark - Storyboards

+ (instancetype)mainStoryboard
{
    static id _mainStoryboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mainStoryboard = [UIStoryboard storyboardWithName:nil];
    });
    return _mainStoryboard;
}

+ (instancetype)settingsStoryboard
{
    static id _settingsStoryboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _settingsStoryboard = [UIStoryboard storyboardWithName:@"Settings"];
    });
    return _settingsStoryboard;
}

@end
