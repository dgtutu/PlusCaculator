//
//  ViewController.m
//  PlusCaculator
//
//  Created by Ben on 2020/3/12.
//  Copyright © 2020 Ben. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *num1Text;
@property (weak, nonatomic) IBOutlet UITextField *num2Text;
@property (weak, nonatomic) IBOutlet UILabel *sumResultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)sum {
    //1.拿到字符串
    NSString *sum1String=self.num1Text.text;
    NSString *sum2String=self.num2Text.text;
    if(sum1String.length==0 ||sum2String.length==0){
        NSLog(@"请输入数字");
        [self showWarning:@" 请输入数字" andMessage:@"没错就是你"];
        
        return;
    }
    //2.字符串转成数值
    NSInteger sum1=[sum1String integerValue];
    NSInteger sum2=[sum2String integerValue];
    
    //3.相加
    NSInteger result =sum1+sum2;
    
    
    //4.显示结果
    self.sumResultLabel.text=[NSString stringWithFormat:@"%zd",result];
}
 

-(void)showWarning:(NSString *)warning andMessage:(NSString *)message{
    UIAlertController *alert
           = [UIAlertController
              alertControllerWithTitle:warning
              message:message
              preferredStyle:UIAlertControllerStyleAlert];
           //preferredStyle是设置提示框的类型，有两种可以选择
           //底部提示框 UIAlertControllerStyleActionSheet
           //中部提示框 UIAlertControllerStyleAlert
           
           
           [alert
            addAction:[UIAlertAction
                       actionWithTitle:@"OJBK"
                       style:UIAlertActionStyleDefault
                       handler:^(UIAlertAction * _Nonnull action) { }]];
           //这种方法没有代理方法，而是直接将点击事件直接写在添加按钮后面的块里面。
           //这里的style也有三个可以选择，根据自己需求选择即可
           //UIAlertActionStyleDefault, //默认
           //UIAlertActionStyleCancel, //取消
           //UIAlertActionStyleDestructive //警告
           
           
           [self
            presentViewController:alert
            animated:YES completion:nil];
}
@end
