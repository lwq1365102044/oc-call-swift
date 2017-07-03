//
//  ViewController.m
//  oc->swift
//
//  Created by 刘文强 on 2017/7/3.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ViewController.h"
#import "oc__swift-Swift.h"

@interface ViewController ()<editTextFiledDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    test * swift = [[test alloc]init];
    [swift test];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    testSwiftViewController *view = [[testSwiftViewController alloc]init];
    view.model = @"model-project";
    view.proId = @"hhahah";
    [view modeleWithModele:@"modle-func"];
    /**
     swift中的属性 可以使用set方法调用
     */
    [view setProId:@"model-project-100"];
    view.textfileddelegate = self;
    view.myeditBlock = ^(NSString * _Nonnull str) {
        
        NSLog(@"--------oc中通过block 接受到的参数:%@",str);
    };
    [self presentViewController:view animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 调用swift中的代理方法
 */
- (void)editTextfiledDeleWithStr:(NSString *)str
{
    NSLog(@"=======oc中通过代理接受到的参数:%@",str);
}


@end
