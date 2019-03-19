//
//  HomePageViewController.m
//  LoanSupermarket
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "HomePageViewController.h"
#import "WMPageController.h"
#import "HomePageTableViewCell.h"

@interface HomePageViewController ()<WMPageControllerDelegate,UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>
{
    CGFloat header_Height;
    
}
@property (nonatomic,strong)UITableView *mainTableView;
@property(nonatomic,strong) UIScrollView  *parentScrollView;

@property(nonatomic,strong) UIView  *headerView;
@property(nonatomic,strong) SDCycleScrollView  *cycScrollview;
@property(nonatomic,strong) UIView  *fenleiView;
@property(nonatomic,strong) UIView  *tuijianView;
@property(nonatomic,strong) UILabel  *tuijianName;
@property(nonatomic,strong) UIButton  *shenqingBtn;
@property(nonatomic,strong) UILabel  *tuijianEDu;

@property(nonatomic,strong) UIView  *footerView;



@end

@implementation HomePageViewController

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y;
    self.navBarView.alpha = (offset+kNavBarHAbove7)/kNavBarHAbove7;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.localButton addTarget:self action:@selector(clickbbb) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.mainTableView];
    
    [self setUpFenLeiButton];
    [self setupTuijianSet];
    [self headerLookMore];
    [self footerLookMore];
}
#pragma mark - 定位事件
- (void)clickbbb{
    [self.localButton setTitle:@"无锡市" forState:UIControlStateNormal];
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = UIColor.whiteColor;
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell.btn setTitleColor:baseColor forState:UIControlStateNormal];
    LRViewBorderRadius(cell.btn, 5, 1, baseColor);
    return cell;
}


- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -kNavBarHAbove7, SCREEN_WIDTH, SCREEN_HEIGHT+kNavBarHAbove7) style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.estimatedSectionHeaderHeight = 0;
        _mainTableView.estimatedSectionFooterHeight = 0;
        [_mainTableView registerNib:[UINib nibWithNibName:@"HomePageTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        _mainTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _mainTableView.tableHeaderView = self.headerView;
        _mainTableView.tableFooterView = self.footerView;
    }
    return _mainTableView;
}
//头视图
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [ZCControl viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 561) viewColor:COLOR(.8, .3)];
        [_headerView addSubview:self.cycScrollview];
        [_headerView addSubview:self.fenleiView];
        [_headerView addSubview:self.tuijianView];
    }
    return _headerView;
}
#pragma mark - 轮播图
- (SDCycleScrollView *)cycScrollview{
    if (!_cycScrollview) {
        _cycScrollview = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        _cycScrollview.delegate = self;
        _cycScrollview.imageURLStringsGroup = @[@"a",@"b",@"c"];
    }
    return _cycScrollview;
}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}
#pragma mark - 分类
- (UIView *)fenleiView{
    if (!_fenleiView) {
        _fenleiView = [ZCControl viewWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 100) viewColor:UIColor.whiteColor];
    }
    return _fenleiView;
}
- (void)setUpFenLeiButton{
    NSMutableArray *arr1 = [@[@"本周放款王",@"大额低息贷",@"我要投诉",@"公益救助"]mutableCopy];
    NSMutableArray *arr2 = [@[@"fl1",@"fl2",@"fl3",@"fl4"]mutableCopy];
    int b = 0;
    int hangshu;
    if (arr1.count % 4 == 0 ) {
        hangshu = (int )arr1.count / 4;
    } else {
        hangshu = (int )arr1.count / 4 + 1;
    }
    for (int i = 0; i < hangshu; i++) {
        for (int j = 0; j < 4; j++) {
            SQButton *btn = [SQButton buttonWithType:UIButtonTypeCustom];
            if ( b  < arr1.count) {
                btn.frame = CGRectMake((0  + j * SCREEN_WIDTH/4), (i * 100) ,SCREEN_WIDTH/4, 100);
                btn.tag = b;
                [btn setTitle:arr1[b] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
                btn.titleLabel.font = FONT(14);
                UIImage *image = [UIImage imageNamed:arr2[b]];
                [btn setImage:image forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(clickFenLeiButton:) forControlEvents:UIControlEventTouchUpInside];
                [self.fenleiView addSubview:btn];
                if (b > arr1.count)
                {
                    [btn removeFromSuperview];
                }
            }
            b++;
        }
    }
}
- (void)clickFenLeiButton:(SQButton *)sender{
    
    
}
#pragma mark - 推荐
- (UIView *)tuijianView{
    if (!_tuijianView) {
        _tuijianView = [ZCControl viewWithFrame:CGRectMake(0, 310, SCREEN_WIDTH, 200) viewColor:UIColor.whiteColor];
        [_tuijianView addSubview:self.shenqingBtn];
        [_tuijianView addSubview:self.tuijianName];
        [_tuijianView addSubview:self.tuijianEDu];
    }
    return _tuijianView;
}
- (UILabel *)tuijianName{
    if (!_tuijianName) {
        _tuijianName = [ZCControl createLabelWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 20) Font:16 Text:@"信用钱包" textColor:UIColor.blueColor NSTextAlignment:NSTextAlignmentCenter];
    }
    return _tuijianName;
}
- (UIButton *)shenqingBtn{
    if (!_shenqingBtn) {
        _shenqingBtn = [ZCControl createButtonNormalFrame:CGRectMake(20, 150, SCREEN_WIDTH-40, 40) Target:self Action:@selector(clickShenQing) Title:@"立即申请" TitleColor:UIColor.whiteColor Font:15 BackGColor:baseColor];
        LRViewBorderRadius(_shenqingBtn, 5, 0, UIColor.clearColor);
    }
    return _shenqingBtn;
}
- (void)clickShenQing{
    
}
- (void)setupTuijianSet{
    UILabel *lab = [ZCControl createLabelWithFrame:CGRectMake(80, 40, SCREEN_WIDTH-160, 20) Font:12 Text:@"🌟无需下载APP|额度高、放款快、利率低" textColor:UIColor.lightGrayColor NSTextAlignment:NSTextAlignmentCenter];
    [self.tuijianView addSubview:lab];
    UIView *lin1 = [ZCControl viewWithFrame:CGRectMake(10, 49.5, 70, 1) viewColor:UIColor.lightGrayColor];
    [self.tuijianView addSubview:lin1];
    
    UIView *lin2 = [ZCControl viewWithFrame:CGRectMake(SCREEN_WIDTH-80, 49.5, 70, 1) viewColor:UIColor.lightGrayColor];
    [self.tuijianView addSubview:lin2];
}
- (UILabel *)tuijianEDu{
    if (!_tuijianEDu) {
        _tuijianEDu = [ZCControl createLabelWithFrame:CGRectMake(10, 80, SCREEN_WIDTH-20, 50) Font:32 Text:@"4000~5W" textColor:UIColor.blackColor NSTextAlignment:NSTextAlignmentCenter];
    }
    return _tuijianEDu;
}


#pragma mark - 查看更多
- (void)headerLookMore{
    UIView *bgv = [ZCControl viewWithFrame:CGRectMake(0, 520, SCREEN_WIDTH, 40) viewColor:UIColor.whiteColor];
    [self.headerView addSubview:bgv];
    UIView *line = [ZCControl viewWithFrame:CGRectMake(0, 560, SCREEN_WIDTH, 1) viewColor:COLOR(.8, .3)];
    [self.headerView addSubview:line];
    UILabel *titlelab = [ZCControl createLabelWithFrame:CGRectMake(10, 0, 100, 40) Font:16 Text:@"今日爆款" textColor:UIColor.blackColor NSTextAlignment:NSTextAlignmentLeft];
    [bgv addSubview:titlelab];
    
    SQCustomButton *btn = [[SQCustomButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-65, 0, 55, 40) type:SQCustomButtonRightImageType imageSize:CGSizeMake(20, 20) midmargin:5];
    btn.titleLabel.text = @"更多";
    btn.imageView.image = [UIImage imageNamed:@"rightjt"];
    btn.titleLabel.textColor = RGB(191, 191, 191);
    [bgv addSubview:btn];
    
    UIButton *lookbtn = [ZCControl createButtonWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40) ImageName:@"" Target:self Action:@selector(clickTopLookMore)];
    [bgv addSubview:lookbtn];
}
- (void)clickTopLookMore{
    self.tabBarController.selectedIndex = 1;
}


#pragma mark - footerView
- (UIView *)footerView{
    if (!_footerView) {
        _footerView = [ZCControl viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) viewColor:COLOR(.8, .3)];
    }
    return _footerView;
}
#pragma mark - 底部查看更多
- (void)footerLookMore{
    UIView *line = [ZCControl viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1) viewColor:COLOR(.8, .3)];
    [self.footerView addSubview:line];
    SQCustomButton *btn = [[SQCustomButton alloc]initWithFrame:CGRectMake(0, 1, SCREEN_WIDTH, 40) type:SQCustomButtonRightImageType imageSize:CGSizeMake(20, 20) midmargin:5];
    btn.titleLabel.text = @"更多";
    btn.backgroundColor = UIColor.whiteColor;
    btn.imageView.image = [UIImage imageNamed:@"rightjt"];
    btn.titleLabel.textColor = RGB(191, 191, 191);
    [self.footerView addSubview:btn];
    [btn touchAction:^(SQCustomButton * _Nonnull button) {
        self.tabBarController.selectedIndex = 1;
    }];
}


@end
