//
//  InfoBaseViewController.m
//  UniversalApp
//
//  Created by wl on 2018/3/30.
//  Copyright © 2018年 客户端. All rights reserved.
//

#import "InfoBaseViewController.h"
#import "MJRefresh.h"



@interface InfoBaseViewController ()
{
    UIImage *navigationBarimg;
}
@end

@implementation InfoBaseViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

   //[self.navigationController.view insertSubview:self.navBarView belowSubview:self.navigationController.navigationBar];

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



- (UIButton *)localButton{
    if (!_localButton) {
        self.localButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.localButton.frame = CGRectMake(0, kStatusBarHeight, 80, 44);
        self.localButton.titleLabel.font = FONT(14);
        [self.localButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [self.localButton setTitle:@"555" forState:UIControlStateNormal];
    }
    return _localButton;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    
    
}


- (UIView *)navBarView{
    if (!_navBarView) {
        _navBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kNavBarHAbove7)];
        _navBarView.backgroundColor = [UIColor whiteColor];
        _navBarView.alpha = 1;
        _navBarView.userInteractionEnabled = YES;
        [_navBarView addSubview:self.imgv];
        [_navBarView addSubview:self.localButton];
    }
    return _navBarView;
}
- (UIImageView *)imgv{
    if (!_imgv) {
        _imgv = [ZCControl createImageViewWithFrame:CGRectMake(50, kStatusBarHeight+12, SCREEN_WIDTH-100, 20) ImageName:@"top"];
        _imgv.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imgv;
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
