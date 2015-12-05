//
//  MainViewController.m
//  health
//
//  Created by lizhuzhu on 15/10/25.
//  Copyright © 2015年 lizhuzhu. All rights reserved.
//

#import "MainViewController.h"

#import "HPublic.h"
#import "HTypeCell.h"

#define MainCellIdentifier  @"MainCellIdentifier"
@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
}

@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSComparisonResult order = [[UIDevice currentDevice].systemVersion compare: @"7.0" options: NSNumericSearch];
    if (order == NSOrderedSame || order == NSOrderedDescending)
    {
        // OS version >= 7.0
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = YES ;
    }
    
    self.navigationItem.title = @"中医养生";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"介绍" style:UIBarButtonItemStylePlain target:self action:@selector(introView)];

    
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor greenMunsell];
    

    
    [_tableView anchorTopLeftWithLeftPadding:0 topPadding:0 width:CGRectGetWidth(self.view.frame) height:CGRectGetHeight(self.view.frame)];
                                                                                                                         
    [self.view addSubview:_tableView];

    
    
    [_tableView registerClass:[HTypeCell class] forCellReuseIdentifier:MainCellIdentifier];
    
    
    
    _dataArray = [NSMutableArray new];
    
    
    NSMutableDictionary *dict = [NSMutableDictionary new];
    dict[@"title"] = @"十二时辰养生";
    dict[@"icon"] = @"shichen";
    [_dataArray addObject:dict];
    
    dict = [NSMutableDictionary new];
    dict[@"title"] = @"音乐养生";
    dict[@"icon"] = @"yinyue";    
    
    [_dataArray addObject:dict];
    
    dict = [NSMutableDictionary new];
    dict[@"title"] = @"经络养生";
    dict[@"icon"] = @"jingluo";
    
    [_dataArray addObject:dict];
    
}

- (void)viewDidLayoutSubviews
{
    _tableView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:MainCellIdentifier forIndexPath:indexPath];
    
    if (nil == cell) {
        cell = [[HTypeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MainCellIdentifier];
    }


    [cell setData:_dataArray[indexPath.row]];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100*XA;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self jumpToViewController:indexPath];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self jumpToViewController:indexPath];
}

- (void)jumpToViewController:(NSIndexPath *)indexPath
{


}


- (void)introView
{
    IntroViewController *iv = [IntroViewController new];
    [iv loadPath:[NSURL URLWithString:@"http://zhiyurencai.cn/public/pdf/a.pdf"]];
    [self.navigationController pushViewController:iv animated:YES];
}
@end
