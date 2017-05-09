//
//  LXSAddressBookViewController.m
//  LXSWeChat
//
//  Created by delegate on 2017/4/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "LXSAddressBookViewController.h"
#import <Hyphenate/Hyphenate.h>
@interface LXSAddressBookViewController ()<EMClientDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textfied;

@end

@implementation LXSAddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)addFriendAction:(UIButton *)sender
{
    //添加好友
    //1.获取要添加好友 的名字
    NSString *name = self.textfied.text;
    //2.向服务器发送一个添加好友的请求
//    NSString *message = [@"我是" stringByAppendingString:@""];
    [[EMClient sharedClient].contactManager addContact:name
                                               message:@"我想加您为好友"
                                            completion:^(NSString *aUsername, EMError *aError) {
                                                if (!aError) {
                                                    NSLog(@"邀请发送成功");
                                                }else
                                                {
                                                    NSLog(@"邀请发送失败");
                                                }
                                            }];
    
}


@end
