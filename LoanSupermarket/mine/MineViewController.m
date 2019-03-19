//
//  MineViewController.m
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/19.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MineViewController.h"
#import "WMPageController.h"

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
@property(nonatomic,strong) UIImageView *img;

@property(nonatomic,strong) UIView  *topView;
@property(nonatomic,strong) UIView  *topTwoView;

@end

@implementation MineViewController

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
    
    [self setupTopBtn];
    // Do any additional setup after loading the view.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = UIColor.whiteColor;
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"我的大杂烩";
    
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
    }
    return _mainTableView;
}


//头视图
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [ZCControl viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 400) viewColor:COLOR(.8, .3)];
        [_headerView addSubview:self.img];
        [_headerView addSubview:self.topView];
        [_headerView addSubview:self.topTwoView];

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
    
    userLAbel = [ZCControl createLabelWithFrame:CGRectMake(85, kNavBarHAbove7, 100, 30) Font:16 Text:@"185****9547" textColor:UIColor.whiteColor NSTextAlignment:NSTextAlignmentLeft];
    [self.img addSubview:userLAbel];
    
    szBtn = [ZCControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH-80, kNavBarHAbove7, 30, 30) ImageName:@"set" Target:self Action:@selector(clickszbtn)];
    [self.img addSubview:szBtn];
    
    yjBtn = [ZCControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH-40, kNavBarHAbove7, 30, 30) ImageName:@"email" Target:self Action:@selector(clickyjbtn)];
    [self.img addSubview:yjBtn];
}

- (void)clickszbtn{
    NSLog(@"szszsz");
}
- (void)clickyjbtn{
    NSLog(@"yjyjyjyj");
}
- (UIView *)topView{
    if (!_topView) {
        _topView = [ZCControl viewWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, 70) viewColor:UIColor.whiteColor];
    }
    return _topView;
}
- (void)setupTopBtn{
    UIButton *btn = [ZCControl createButtonNormalFrame:CGRectMake(0, 0, SCREEN_WIDTH/5, 70) Target:self Action:@selector(clickOne) Title:@"10\n金豆" TitleColor:UIColor.blackColor Font:14 BackGColor:UIColor.whiteColor];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    btn.titleLabel.numberOfLines = 2;
    [self.topView addSubview:btn];
    
    
    UIButton *btn1 = [ZCControl createButtonNormalFrame:CGRectMake(SCREEN_WIDTH/5, 0, SCREEN_WIDTH/5, 70) Target:self Action:@selector(clickTwo) Title:@"2\n优惠券" TitleColor:UIColor.blackColor Font:14 BackGColor:UIColor.whiteColor];
    btn1.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn1.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    btn1.titleLabel.numberOfLines = 2;
    [self.topView addSubview:btn1];
    
    UIButton *btn2 = [ZCControl createButtonNormalFrame:CGRectMake(SCREEN_WIDTH/5*2, 0, SCREEN_WIDTH/5, 70) Target:self Action:@selector(clickThree) Title:@"0.00\n现金红包" TitleColor:UIColor.blackColor Font:14 BackGColor:UIColor.whiteColor];
    btn2.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn2.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    btn2.titleLabel.numberOfLines = 2;
    [self.topView addSubview:btn2];
    
    UIButton *btn3 = [ZCControl createButtonNormalFrame:CGRectMake(SCREEN_WIDTH/5*3, 0, SCREEN_WIDTH/5, 70) Target:self Action:@selector(clickFour) Title:@"1\n拒就陪" TitleColor:UIColor.blackColor Font:14 BackGColor:UIColor.whiteColor];
    btn3.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn3.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    btn3.titleLabel.numberOfLines = 2;
    [self.topView addSubview:btn3];
    
    
    SQCustomButton *btn4 = [[SQCustomButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/5*4, 0, SCREEN_WIDTH/5, 70) type:SQCustomButtonTopImageType imageSize:CGSizeMake(20, 20) midmargin:5];
    btn4.titleLabel.text = @"我的钱包";
    btn4.backgroundColor = UIColor.whiteColor;
    btn4.imageView.image = [UIImage imageNamed:@"wdqb"];
    btn4.titleLabel.textColor = UIColor.blackColor;
    [self.topView addSubview:btn4];
    [btn4 touchAction:^(SQCustomButton * _Nonnull button) {
    }];
}
- (void)clickOne{
    
}
- (void)clickTwo{
    
}
- (void)clickThree{
    
}
- (void)clickFour{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UIView *)topTwoView{
    if (!_topTwoView) {
        _topTwoView = [ZCControl viewWithFrame:CGRectMake(0, 220, SCREEN_WIDTH, 150) viewColor:UIColor.whiteColor];
    }
    return _topTwoView;
}
@end
