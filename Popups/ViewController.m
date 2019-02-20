//
//  ViewController.m
//  Popups
//
//  Created by Arthur on 2018/5/30.
//  Copyright © 2018年 Arthur. All rights reserved.
//

#import "ViewController.h"
#import "PopupsViewDelegate.h"
#import "PopupsViewBlock.h"
@interface ViewController () <POAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch * pTouch = [touches anyObject];
    
    //获取触摸的次数
//    NSUInteger tapCount = [pTouch tapCount];
    
    CGPoint point = [pTouch locationInView:self.view];
    
    NSLog(@"触摸点的坐标：%@",NSStringFromCGPoint(point));
    
    
    if (point.y > [UIScreen mainScreen].bounds.size.height / 2) {
        PopupsViewDelegate *view = [[PopupsViewDelegate alloc] initWithImage:@"allen"];
        view.delegate = self;
        [view showView];
    }else {
        PopupsViewBlock *view = [[PopupsViewBlock alloc] initWithImage:@"dog"];
        [view showView];
        view.block = ^(NSString *imageName) {
            NSLog(@"%@",imageName);
        };
    }
    
    
}

- (void)didSelectedCancel:(PopupsViewDelegate *)popView withImageName:(NSString *)imageName {
    NSLog(@"%@",imageName);
    [popView dismissAlertView];
}


@end
