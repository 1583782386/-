//
//  LXSLoginViewController.m
//  LXSWeChat
//
//  Created by delegate on 2017/4/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "LXSLoginViewController.h"

#import <Hyphenate/Hyphenate.h>

@interface LXSLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LXSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerButton:(UIButton *)sender
{
    NSString *userName = self.nameTextField.text;
    NSString *password = self.passwordTextfield.text;
    
    if (userName.length == 0 || password.length == 0)
    {
        NSLog(@"请输入用户名和密码");
        return;
    }
    EMError *error = [[EMClient sharedClient] registerWithUsername:userName password:password];
    if (error==nil) {
        NSLog(@"注册成功");
    }else
    {
        NSLog(@"注册失败：%@",error);
    }
}

- (IBAction)loginButton:(UIButton *)sender
{
    NSString *userName = self.nameTextField.text;
    NSString *password = self.passwordTextfield.text;
    
    if (userName.length == 0 || password.length == 0)
    {
        NSLog(@"请输入用户名和密码");
        return;
    }
    
    EMError *error = [[EMClient sharedClient] loginWithUsername:userName password:password];
    if (!error) {
        NSLog(@"登录成功");
        //设置自动登录
        EMError *error = [[EMClient sharedClient] loginWithUsername:userName password:password];
        if (!error)
        {
            [[EMClient sharedClient].options setIsAutoLogin:YES];
        }
        //跳转到主界面
        self.view.window.rootViewController = [UIStoryboard storyboardWithName:@"Main" bundle:nil].instantiateInitialViewController;
        
    }else
    {
        NSLog(@"登录失败，%@",error);
    }
}
@end
