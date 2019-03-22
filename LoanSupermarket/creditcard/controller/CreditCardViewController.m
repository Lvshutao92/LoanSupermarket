//
//  CreditCardViewController.m
//  jie
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019年 魏魏莹. All rights reserved.
//

#import "CreditCardViewController.h"
#import "CreditCardTableViewCell.h"

@interface CreditCardViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
{

}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)UIView *headerView;


@property(nonatomic,strong) SDCycleScrollView  *cycScrollview;
@property(nonatomic,strong) UIView  *fenleiView;
@end

@implementation CreditCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
    // Do any additional setup after loading the view.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CreditCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    LRViewBorderRadius(cell.img, 10, 0, UIColor.clearColor);
    if (indexPath.row % 2 != 0) {
        cell.img.image = [UIImage imageNamed:@"xyklogo"];
    }else{
        cell.img.image = [UIImage imageNamed:@"xyklogo1"];
    }
    
    return cell;
}
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, -kNavBarHAbove7, SCREEN_WIDTH, SCREEN_HEIGHT+kStatusBarHeight)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [_tableview registerNib:[UINib nibWithNibName:@"CreditCardTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        _tableview.tableHeaderView = self.headerView;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [ZCControl viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 310) viewColor:COLOR(.8, .3)];
        [_headerView addSubview:self.cycScrollview];
        [_headerView addSubview:self.fenleiView];

    }
    return _headerView;
}
#pragma mark - 轮播图
- (SDCycleScrollView *)cycScrollview{
    if (!_cycScrollview) {
        _cycScrollview = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        _cycScrollview.delegate = self;
        _cycScrollview.imageURLStringsGroup = @[@"xyklogo",@"xyklogo1"];
    }
    return _cycScrollview;
}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"=======%ld",index);
}
#pragma mark - 分类
- (UIView *)fenleiView{
    if (!_fenleiView) {
        _fenleiView = [ZCControl viewWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 100) viewColor:UIColor.whiteColor];
        [self setUpFenLeiButton];
    }
    return _fenleiView;
}

- (void)setUpFenLeiButton{
    SQCustomButton *btn = [[SQCustomButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2, 100) type:SQCustomButtonTopImageType imageSize:CGSizeMake(45, 45) midmargin:5];
    btn.titleLabel.text = @"信用卡还款";
    btn.backgroundColor = UIColor.whiteColor;
    btn.imageView.image = [UIImage imageNamed:@"xykhk"];
    btn.titleLabel.textColor = UIColor.lightGrayColor;
    [self.fenleiView addSubview:btn];
    [btn touchAction:^(SQCustomButton * _Nonnull button) {
        if ([GlobleStting getpwd].length>0) {
            
        }else{
            LoginViewController *vc = [[LoginViewController alloc]init];
            vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:vc animated:YES completion:nil];
        }
    }];
    
    SQCustomButton *btn1 = [[SQCustomButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, 100) type:SQCustomButtonTopImageType imageSize:CGSizeMake(45, 45) midmargin:5];
    btn1.titleLabel.text = @"开卡进度查询";
    btn1.backgroundColor = UIColor.whiteColor;
    btn1.imageView.image = [UIImage imageNamed:@"kkjdcx"];
    btn1.titleLabel.textColor = UIColor.lightGrayColor;
    [self.fenleiView addSubview:btn1];
    [btn1 touchAction:^(SQCustomButton * _Nonnull button) {
        if ([GlobleStting getpwd].length>0) {
            
        }else{
            LoginViewController *vc = [[LoginViewController alloc]init];
            vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:vc animated:YES completion:nil];
        }
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]forBarMetrics:UIBarMetricsDefault];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationItem.title = @"";
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
}
@end
