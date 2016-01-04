//
//  MsgDetailViewController.m
//  2014-12-25-frameworkDemo
//
//  Created by macbook on 15/1/3.
//  Copyright (c) 2015年 rick. All rights reserved.
//

#import "MsgDetailViewController.h"

@interface MsgDetailViewController ()
 @property (weak, nonatomic) IBOutlet UILabel *textName;
 @property (weak, nonatomic) NSString *preValue;
@end

@implementation MsgDetailViewController
@synthesize preValue;

 - (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self perAction: [self preValue]];
     self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onTitleRightClic:)];
     
}
-(void) onTitleRightClic:(id)sender  {
    [self performSegueWithIdentifier:@"segueMsgPlus" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)perAction:(NSString*)obj{
    NSLog(obj);
    [_textName setText:obj];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
