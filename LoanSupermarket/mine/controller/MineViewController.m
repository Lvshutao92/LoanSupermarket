//
//  MineViewController.m
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/19.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MineViewController.h"
#import "WMPageController.h"
#import "MyActivityView.h"
#import "MyOrderView.h"
#import "QianDaoView.h"
#import "ChangYongToolsView.h"
#import "SetViewController.h"

@interface MineViewController ()<WMPageControllerDelegate,UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>
{
    CGFloat header_Height;
    
    
    UILabel *userLAbel;
    UIImageView *userImageView;
    UIButton *szBtn;
    UIButton *yjBtn;
}
@property (nonatomic,strong)UITableView *mainTableView;
@property(nonatomic,strong) UIScrollView  *parentScrollView;

@property(nonatomic,strong) UIView  *headerView;
@property(nonatomic,strong) UIView  *footerView;

@property(nonatomic,strong) UIImageView *img;

@property(nonatomic,strong) MyActivityView  *myActivityView;
@property(nonatomic,strong) MyOrderView  *myOrderView;
@property(nonatomic,strong) QianDaoView  *qianDaoView;
@property(nonatomic,strong) ChangYongToolsView  *changyongView;

@property(nonatomic,strong) UIImageView *guangGaoImage;

@end

@implementation MineViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    if ([GlobleStting getpwd].length>0) {
        self.myActivityView.hidden = NO;
        self.qianDaoView.hidden = NO;
        self.myOrderView.frame = CGRectMake(0, 290, SCREEN_WIDTH, 70);
        self.guangGaoImage.frame = CGRectMake(0, 365, SCREEN_WIDTH, 60);
        self.changyongView.frame = CGRectMake(0, 430, SCREEN_WIDTH, 340);
        self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 780);
        
        userLAbel.text = @"185****9547";
        self.userlab.text = @"185****9547";
    }else{
        self.myActivityView.hidden = YES;
        self.qianDaoView.hidden = YES;
        self.myOrderView.frame = CGRectMake(0, 150, SCREEN_WIDTH, 70);
        self.guangGaoImage.frame = CGRectMake(0, 225, SCREEN_WIDTH, 60);
        self.changyongView.frame = CGRectMake(0, 290, SCREEN_WIDTH, 340);
        self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 640);
        
        userLAbel.text = @"登录/注册";
        self.userlab.text =  @"登录/注册";
    }
    
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y;
    self.navBarView.alpha = (offset-25)/kNavBarHAbove7;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainTableView];
    
    [self.setButton addTarget:self action:@selector(clickszbtn) forControlEvents:UIControlEventTouchUpInside];
    [self.eamilyButton addTarget:self action:@selector(clickyjbtn) forControlEvents:UIControlEventTouchUpInside];
    [self setupHeaderView];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = UIColor.whiteColor;
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.tableHeaderView = self.headerView;
        _mainTableView.tableFooterView = self.footerView;

    }
    return _mainTableView;
}


#pragma mark -  头视图-----尾视图
- (UIView *)footerView{
    if (!_footerView) {
        _footerView = [ZCControl viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100) viewColor:UIColor.whiteColor];
    }
    return _footerView;
}


- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [ZCControl viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 780) viewColor:COLOR(.8, .3)];
        [_headerView addSubview:self.img];
        [_headerView addSubview:self.myActivityView];
        [_headerView addSubview:self.myOrderView];
        [_headerView addSubview:self.qianDaoView];
        [_headerView addSubview:self.changyongView];
        [_headerView addSubview:self.guangGaoImage];
    }
    return _headerView;
}

- (UIImageView *)img{
    if (!_img) {
        _img = [ZCControl createImageViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150) ImageName:@"icon_me_user_bg"];
    }
    return _img;
}
- (void)setupHeaderView{
    userImageView = [ZCControl createImageViewWithFrame:CGRectMake(10, kNavBarHAbove7, 70, 70) ImageName:@"tx"];
    [self.img addSubview:userImageView];
    
    userLAbel = [ZCControl createLabelWithFrame:CGRectMake(85, kNavBarHAbove7, 100, 30) Font:16 Text:@"" textColor:UIColor.whiteColor NSTextAlignment:NSTextAlignmentLeft];
    [self.img addSubview:userLAbel];
    
    szBtn = [ZCControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH-80, kNavBarHAbove7, 30, 30) ImageName:@"set" Target:self Action:@selector(clickszbtn)];
    [self.img addSubview:szBtn];
    
    yjBtn = [ZCControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH-40, kNavBarHAbove7, 30, 30) ImageName:@"email" Target:self Action:@selector(clickyjbtn)];
    [self.img addSubview:yjBtn];
}

- (void)clickszbtn{
    if ([GlobleStting getpwd].length>0) {
        SetViewController *vc = [[SetViewController alloc]init];
        vc.title = @"设置";
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        LoginViewController *vc = [[LoginViewController alloc]init];
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:vc animated:YES completion:nil];
    }
}
- (void)clickyjbtn{
    if ([GlobleStting getpwd].length>0) {
        
    }else{
        LoginViewController *vc = [[LoginViewController alloc]init];
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:vc animated:YES completion:nil];
    }
}



- (MyActivityView *)myActivityView{
    if (!_myActivityView) {
        _myActivityView = [[MyActivityView alloc]initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, 70)];
        _myActivityView.backgroundColor = UIColor.whiteColor;
    }
    return _myActivityView;
}


- (QianDaoView *)qianDaoView{
    if (!_qianDaoView) {
        _qianDaoView = [[QianDaoView alloc]initWithFrame:CGRectMake(0, 220, SCREEN_WIDTH, 70)];
        _qianDaoView.backgroundColor = UIColor.whiteColor;
    }
    return _qianDaoView;
}




- (MyOrderView *)myOrderView{
    if (!_myOrderView) {
        _myOrderView = [[MyOrderView alloc]initWithFrame:CGRectMake(0, 290, SCREEN_WIDTH, 70)];
        _myOrderView.backgroundColor = UIColor.whiteColor;
    }
    return _myOrderView;
}

- (UIImageView *)guangGaoImage{
    if (!_guangGaoImage) {
        _guangGaoImage = [ZCControl createImageViewWithFrame:CGRectMake(0, 365, SCREEN_WIDTH, 60) ImageName:@"ggimg"];
    }
    return _guangGaoImage;
}



- (ChangYongToolsView *)changyongView{
    if (!_changyongView) {
        _changyongView = [[ChangYongToolsView alloc]initWithFrame:CGRectMake(0, 430, SCREEN_WIDTH, 340)];
        _changyongView.backgroundColor = UIColor.whiteColor;
        
    }
    return _changyongView;
}


@end
