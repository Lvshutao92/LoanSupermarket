//
//  Header.h
//  LoanSupermarket
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019年 apple. All rights reserved.
//

#ifndef Header_h
#define Header_h


#define AUTHURLL(UID) [NSString stringWithFormat:@"http://ai.51jinkong.cn/%@", UID]

//#define WC_SaveInfoKey @"WL_account_key"//--保存用户信息的借口

#define  newsuer             @"app/Login/newsuer"//-注册
#define  logingo             @"app/Login/logingo"//-登陆
#define  getPhoneCode        @"app/Login/getPhoneCode"//-验证码
#define  showOrder           @"app/Usercenter/showOrder"//-首页
#define  getResult           @"app/Usercenter/getResult"//-首页接口
#define  saveTelLog          @"app/login/savetel"//-保存通讯录
#define  getDuotou           @"app/login/getDuotou"//-多头认证
#define  geographical        @"app/login/geographical"//-地理位置
#define  recognition         @"app/Validation/recognition"//-身份证认证
#define  BASIC_URL           @"app/Validation/basic"//-基础信息认证
#define  Socaial_URL         @"app/Validation/social"//-社交认证
#define  authentication      @"app/Login/authentication"//-认证状态
#define  queryBankCard       @"app/Usercenter/queryBankCard"//-查询开户银行
#define  checkbankCard       @"app/Usercenter/checkbankCard"//-绑定银行卡时获取验证码
#define  BangBankCard        @"app/Usercenter/bindingbankCard"//-绑定银行卡
#define  bankCardList        @"app/Usercenter/bankCardList"//-银行卡列表
#define  JIeBangCard         @"app/Usercenter/unbindingbankCard"//-解绑银行卡
#define  getRepayment        @"app/Usercenter/getRepayment"//-我要还款的列表
#define  goRepayment         @"app/Usercenter/goRepayment"//-我要还款跳支付界面获取银行卡信息
#define  xuqi_url            @"app/Usercenter/xuqi"//-续期接口
#define  shenqing            @"app/Usercenter/shenqing"//-申请接口
#define  doXuqi              @"app/Usercenter/doXuqi"//-续期银行卡付款接口
#define  goRepayment         @"app/Usercenter/goRepayment"//---我要还款条道支付页面所获取账号信息
#define  uploadRecord        @"app/Usercenter/upload_hai_jietu"//---上传支付宝微信的截图
#define  ZHiXinPay           @"app/Usercenter/xianxia_hai"//----s支付宝微信上传图片等信息
#define  UPLOAD_HEAD         @"app/Usercenter/upload_hai_jietu"//银行卡还款
#define  BankPay             @"app/Usercenter/pay"//银行卡还款
#define  orderRecord         @"app/Usercenter/orderRecord"//我的订单表
#define  Account_Url         @"app/Usercenter/getCollectionAccount"//---支付界面获取支付宝还有微信二维码与账号
#define  jietixian           @"app/usercenter/tixian"//t我要借款体现的确定按钮
#define  question            @"web/problems.html?xyqb"//常见问题
#define  lianxius            @"web/contactus.html?xyqb"//联系我们
#define  gengduo             @"web/wl.html?xyqb"//更多产品
#define  getMessageList      @"app/Message/getMessageList"//w我的消息列表
#define  getSlide            @"app/Index/getSlide"//--首页没有登录时，获取最大额度。
#define  jieloan             @"app/Validation/jieloan"//-多头认证


#endif /* Header_h */

