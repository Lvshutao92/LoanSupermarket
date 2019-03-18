//
//  HomePageViewController.m
//  LoanSupermarket
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "HomePageViewController.h"
#import "WMPageController.h"

@interface HomePageViewController ()<WMPageControllerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    CGFloat header_Height;
}
@property (nonatomic,strong)UITableView *mainTableView;
@property(nonatomic,strong) UIScrollView  *parentScrollView;

@end

@implementation HomePageViewController

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y;
    self.navBarView.alpha = (offset)/100;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleLa.text = @"去哪儿借";
    [self.view addSubview:self.mainTableView];
    
    [self.localButton addTarget:self action:@selector(clickbbb) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clickbbb{
    [self.localButton setTitle:@"无锡市" forState:UIControlStateNormal];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = UIColor.whiteColor;
    [self.navigationController pushViewController:vc animated:YES];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"还是防洪设施个粉红色";
    
    return cell;
    
}



- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -kNavBarHAbove7, SCREEN_WIDTH, SCREEN_HEIGHT+kNavBarHAbove7) style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.estimatedSectionHeaderHeight = 0;
        _mainTableView.estimatedSectionFooterHeight = 0;
        _mainTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _mainTableView.tableHeaderView = [ZCControl viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) viewColor:UIColor.redColor];
    }
    return _mainTableView;
}



@end
