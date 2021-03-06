//
//  LeftSortsViewController.m
//  LGDeckViewController
//
//  Created by jamie on 15/3/31.
//  Copyright (c) 2015年 Jamie-Ling. All rights reserved.
//

#import "LeftSortsViewController.h"
#import "HPublic.h"
#import "LeftSlideViewController.h"

@interface LeftSortsViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *_imageview;
    NSInteger   _pageNum;
}
@end

@implementation LeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _pageNum = 3;
    _imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imageview.image = [UIImage imageNamed:@"backimage2"];
    [self.view addSubview:_imageview];

    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    
    WS(ws);
    [self.tableview addPullToRefreshWithActionHandler:^{
        [ws updateBackgroud];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"推荐";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"分类";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"收听历史";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"下载管理";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"设置";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    App(app);
    
    [app.leftSlideVC closeLeftView];//关闭左侧抽屉
    if (0 == indexPath.row) {
        [app.nav popToRootViewControllerAnimated:NO];
    }
    else if (1 == indexPath.row) {
//        if(nil == app.categoryViewController)
//        {
//            app.categoryViewController = [CategoryViewController new];
//        }
//        
//        if (app.categoryViewController.navigationController) {
//            [app.mainNavigationController popToViewController:app.categoryViewController animated:NO];
//        }
//        else
//        {
//            [app.mainNavigationController pushViewController:app.categoryViewController animated:NO];
//        }
    }
    else if (2 == indexPath.row) {
    }
    else if (3 == indexPath.row) {
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 180;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, 180)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (void)updateBackgroud
{
    if(_pageNum > 5)
    {
        _pageNum = 1;
    }
    
    if(_pageNum < 1 )
    {
        _pageNum = 1;
    }
    
    _imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"backimage%@", @(_pageNum)]];
    
    _pageNum ++;
    
    [self.tableview.pullToRefreshView stopAnimating];

}
@end
