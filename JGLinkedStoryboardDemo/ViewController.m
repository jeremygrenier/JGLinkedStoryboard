//
//  ViewController.m
//  JGLinkedStoryboardDemo
//
//  Created by Jeremy GRENIER on 22/11/2014.
//  Copyright (c) 2014 Jeremy Grenier. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if ( [self.navigationController.viewControllers[0] isEqual:self] ) {
        UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(close)];
        self.navigationItem.leftBarButtonItem = closeButton;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
