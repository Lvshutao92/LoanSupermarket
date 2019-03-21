//
//  MineBaseInfoViewController.m
//  LoanSupermarket
//
//  Created by 吕书涛 on 2019/3/19.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MineBaseInfoViewController.h"

@interface MineBaseInfoViewController ()
{
    UIImage *navigationBarimg;
}
@end

@implementation MineBaseInfoViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.view insertSubview:self.navBarView aboveSubview:self.navigationController.navigationBar];
    
    
    //导航栏透明
    navigationBarimg = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
   
    
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:navigationBarimg forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    [self.navBarView removeFromSuperview];
}







- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (UIButton *)setButton {
    if (!_setButton) {
        _setButton = [ZCControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH-70, kStatusBarHeight+12, 20, 20) ImageName:@"set" Target:self Action:@selector(clickbtn)];
    }
    return _setButton;
}
- (void)clickbtn{
    
}
- (UIButton *)eamilyButton {
    if (!_eamilyButton) {
        _eamilyButton = [ZCControl createButtonWithFrame:CGRectMake(SCREEN_WIDTH-30, kStatusBarHeight+12, 20, 20) ImageName:@"email" Target:self Action:@selector(clickbtn1)];
    }
    return _eamilyButton;
}
- (void)clickbtn1{
    
}


- (UIView *)navBarView{
    if (!_navBarView) {
        _navBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kNavBarHAbove7)];
        _navBarView.backgroundColor = baseColor;
        _navBarView.alpha = 1;
        _navBarView.userInteractionEnabled = YES;
        [_navBarView addSubview:self.userImg];
        [_navBarView addSubview:self.userlab];

        [_navBarView addSubview:self.setButton];
        [_navBarView addSubview:self.eamilyButton];
    }
    return _navBarView;
}
- (UIImageView *)userImg{
    if (!_userImg) {
        _userImg = [ZCControl createImageViewWithFrame:CGRectMake(10, kStatusBarHeight+7, 30, 30) ImageName:@"tx"];
        _userImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _userImg;
}
- (UILabel *)userlab {
    if (!_userlab) {
        _userlab = [ZCControl createLabelWithFrame:CGRectMake(45, kStatusBarHeight+7, 100, 30) Font:12 Text:@"185****9547" textColor:UIColor.whiteColor NSTextAlignment:NSTextAlignmentLeft];
    }
    return _userlab;
}


//如果重写这个 需要添加到子类
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.mj_offsetY;
    if (offset<kNavBarHAbove7) {
        
        CGFloat  diff = fabs(kNavBarHAbove7-offset);
        CGFloat alpha = 1-diff/kNavBarHAbove7;
        _navBarView.alpha = alpha;
    }
    //    self.navigationController.navigationBar.tintColor = KBlackColor;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
