//
//  HomeViewController.m
//  2014-12-25-frameworkDemo
//
//  Created by macbook on 14/12/25.
//  Copyright (c) 2014年 rick. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray* array;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray* array=[[NSArray alloc]initWithObjects:@"hello",@"world",@"world",@"world",@"world",@"world",@"world",@"world",@"world" , nil];
    _array=array;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    
}
//重新显示tabbar
- (void)viewDidDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[NSString alloc] initWithFormat:[NSString stringWithFormat:@"音乐%d",section] ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_array) {
        return  [_array count];
    }
    return 0;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"msgCellId" forIndexPath:indexPath];
    UITextView *textView=(id)[cell viewWithTag:1];
    [textView setText: [_array objectAtIndex:[indexPath row]]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    NSLog(@"选中%d",[indexPath row]);
    [self performSegueWithIdentifier:@"segueMsgDetail" sender:self];
    [_tableView deselectRowAtIndexPath:indexPath animated:NO];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSIndexPath * indexPath= [_tableView indexPathForSelectedRow];
    NSInteger index=[indexPath row];
    UIViewController * destViewController=[segue destinationViewController];
    if ([destViewController respondsToSelector:@selector(setPreValue:)]) {
        //
        [destViewController setValue:[_array objectAtIndex:index] forKey:@"preValue"];
    }
    [self setHidesBottomBarWhenPushed:YES];
    
}


@end
