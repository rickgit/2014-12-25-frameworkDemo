//
//  MsgPlusViewController.m
//  2014-12-25-frameworkDemo
//
//  Created by macbook on 15/1/15.
//  Copyright (c) 2015年 rick. All rights reserved.
//

#import "MsgPlusViewController.h"

@implementation MsgPlusViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    UINavigationItem *item=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(titleRightSave:)];
    self.navigationItem.rightBarButtonItem=item;
}
- (void)titleRightSave:(id)sender{
    //保存到数据库
}
@end
