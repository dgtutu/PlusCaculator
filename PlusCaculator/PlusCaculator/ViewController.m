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
    
    //创建UILabel对象
    UILabel *label=[UILabel new];
    //设置frame
    label.frame=CGRectMake(160, 400, 100, 75);
    //设置背景色
    label.backgroundColor=[UIColor greenColor];
    //设置文字
    label.text=@"叻叻猪";
    //居中
    label.textAlignment=NSTextAlignmentCenter;
    //设置字体大小
    label.font=[UIFont systemFontOfSize:25.f];
    //设置行数
    label.numberOfLines=0;
    //设置换行
    label.lineBreakMode=NSLineBreakByWordWrapping;
    //设置文字的颜色
    label.textColor=[UIColor purpleColor];
    //添加控制器的view中
    [self.view addSubview:label];
    
    //创建UIImage对象
    UIImageView *imageView=[UIImageView new];
    //设置frame
    imageView.frame =CGRectMake(160, 600, 100, 100);
    //设置大小
    imageView.bounds =CGRectMake(0, 0, 200, 200);
    //设置背景
    imageView.backgroundColor=[UIColor purpleColor];
    //设置图片
    imageView.image=[UIImage imageNamed:@"111"];
    //设置图片模式
    imageView.contentMode=UIViewContentModeTopRight ;
    /**
            //带有scale 标识图片有可能被拉伸或者压缩
           UIViewContentModeScaleToFill,    //完全的压缩
     
            //Ascept标识缩放是带有比例的,不会变形
           UIViewContentModeScaleAspectFit, //宽高比不变 适应
           UIViewContentModeScaleAspectFill, //
           
            // 重新绘制
           UIViewContentModeRedraw,
     
            // 不带有scale 标识,图片不可能被拉伸或者压缩
           UIViewContentModeCenter,
           UIViewContentModeTop,
           UIViewContentModeBottom,
           UIViewContentModeLeft,
           UIViewContentModeRight,
           UIViewContentModeTopLeft,
           UIViewContentModeTopRight,
           UIViewContentModeBottomLeft,
           UIViewContentModeBottomRight,
     */
    //裁剪多余部分
    imageView.clipsToBounds=YES;
    //加入到控制器中
     [self.view addSubview:imageView];
    
    UIToolbar *toolbar=[[UIToolbar alloc]init];
    toolbar.barStyle=UIBarStyleBlack;
    toolbar.alpha=0.7;
    toolbar.frame =imageView.bounds;
    [imageView addSubview:toolbar];
    
   
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
