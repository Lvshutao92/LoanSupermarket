//
//  LoanViewController.m
//  jie
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019年 魏魏莹. All rights reserved.
//

#import "LoanViewController.h"
#import "MoreDropDownMenu.h"
#import "LoanTableViewCell.h"

@interface LoanViewController ()<UITableViewDelegate,UITableViewDataSource,MoreDropDownMenuDataSource,MoreDropDownMenuDelegate>
{
    NSString *str1;
    NSString *str2;
    NSString *str3;
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UIImageView *headerImageView;


@property (nonatomic, strong) NSArray               *cates;
@property (nonatomic, strong) NSArray               *states;
@property (nonatomic, strong) NSArray               *sorts;
@property (nonatomic, strong) MoreDropDownMenu       *menu;
@end

@implementation LoanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
    
    self.cates  = @[@"综合排序",@"金额由低到高",@"金额由高到低",@"利息由低到高",@"利息由高到低"];
    self.states = @[@"类型不限",@"高通过率",@"利息低"];
    self.sorts  = @[@"金额不限",@"0-3千",@"3千-8千",@"8千-2万",@"2万-5万",@"5万以上"];


    _menu.finishedBlock=^(MoreIndexPath *indexPath){
        if (indexPath.item >= 0) {
            NSLog(@"收起:点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
        }else {
            NSLog(@"收起:点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
        }
    };
    [_menu selectIndexPath:[MoreIndexPath indexPathWithCol:1 row:1]];
}




#pragma mark - MoreDropDownMenuDataSource and MoreDropDownMenuDelegate
- (NSInteger)numberOfColumnsInMenu:(MoreDropDownMenu *)menu{
    return 3;
}

- (NSInteger)menu:(MoreDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column{
    if (column == 0) {
        return self.cates.count;
    }else if (column == 1){
        return self.states.count;
    }else {
        return self.sorts.count;
    }
}

- (NSString *)menu:(MoreDropDownMenu *)menu titleForRowAtIndexPath:(MoreIndexPath *)indexPath{
    if (indexPath.column == 0) {
        return self.cates[indexPath.row];
    } else if (indexPath.column == 1){
        return self.states[indexPath.row];
    } else {
        return self.sorts[indexPath.row];
    }
}
- (NSArray *)menu:(MoreDropDownMenu *)menu arrayForRowAtIndexPath:(MoreIndexPath *)indexPath{
    if (indexPath.column == 0) {
        return self.cates;
    } else if (indexPath.column == 1){
        return self.states;
    } else {
        return self.sorts;
    }
}

- (void)menu:(MoreDropDownMenu *)menu didSelectRowAtIndexPath:(MoreIndexPath *)indexPath{
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
}

- (void)didTapMenu:(MoreDropDownMenu *)menu{
    //    if (self.moveScroll) {
    //        self.moveScroll(self.tableView);
    //    }
    NSLog(@"点击了菜单");
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kNavBarHAbove7;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    _menu = [[MoreDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:kNavBarHAbove7];
    _menu.delegate = self;
    _menu.dataSource = self;
    return _menu;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 181;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LoanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    [cell.btn setTitleColor:baseColor forState:UIControlStateNormal];
    LRViewBorderRadius(cell.btn, 5, 1, baseColor);

    return cell;
}
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, -kStatusBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT+kStatusBarHeight)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [_tableview registerNib:[UINib nibWithNibName:@"LoanTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.tableHeaderView = self.headerView;
    }
    return _tableview;
}
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [ZCControl viewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) viewColor:UIColor.redColor];
        [_headerView addSubview:self.headerImageView];
    }
    return _headerView;
}

- (UIImageView *)headerImageView{
    if (!_headerImageView) {
        _headerImageView = [ZCControl createImageViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) ImageName:@"dkdq"];
    }
    return _headerImageView;
}






@end
