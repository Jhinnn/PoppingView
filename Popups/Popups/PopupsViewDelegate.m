//
//  PopupsView.m
//  Popups
//
//  Created by Arthur on 2018/5/30.
//  Copyright © 2018年 Arthur. All rights reserved.
//

#import "PopupsViewDelegate.h"

@interface PopupsViewDelegate()

@property (nonatomic, strong) UIView *alertView;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation PopupsViewDelegate


- (instancetype)initWithImage:(NSString *)imageName {
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
    
        self.alertView.frame = CGRectMake(0, 0, 300, 400);
        self.alertView.center = self.center;
        [self addSubview:self.alertView];
        
        self.imageView = [[UIImageView alloc] init];
        self.imageView.frame = CGRectMake(25, 100, 250, 250);
        self.imageView.image = [UIImage imageNamed:imageName];
        [self.imageView.image setAccessibilityIdentifier:imageName];
        
        [self.alertView addSubview:self.imageView];
 
    }
    
    return self;
}

- (UIView *)alertView {
    if (!_alertView) {
        _alertView = [[UIView alloc] init];
        _alertView.backgroundColor = [UIColor whiteColor];
        _alertView.layer.masksToBounds = YES;
        _alertView.layer.cornerRadius = 5;
        _alertView.userInteractionEnabled = YES;
        _alertView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenAction)];
        [_alertView addGestureRecognizer:tap];
    }
    return _alertView;
}

- (void)showView {
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    
    self.alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.2,0.2);
    self.alertView.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0.1 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4f];
        self.alertView.transform = transform;
        self.alertView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hiddenAction {
    if ([_delegate respondsToSelector:@selector(didSelectedCancel:withImageName:)]) {
        [_delegate didSelectedCancel:self withImageName:[self.imageView.image accessibilityIdentifier]];
    }
}


-(void)dismissAlertView {
    [UIView animateWithDuration:.2 animations:^{
        self.alertView.transform = CGAffineTransformMakeScale(0.2, 0.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.08
                         animations:^{
                             self.alertView.transform = CGAffineTransformMakeScale(0.25, 0.25);
                         }completion:^(BOOL finish){
                             [self removeFromSuperview];
                         }];
    }];
}


@end
