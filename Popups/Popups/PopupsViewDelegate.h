//
//  PopupsView.h
//  Popups
//
//  Created by Arthur on 2018/5/30.
//  Copyright © 2018年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopupsViewDelegate;

@protocol POAlertViewDelegate <NSObject>

- (void)didSelectedCancel:(PopupsViewDelegate *)popView withImageName:(NSString *)imageName;

@end

@interface PopupsViewDelegate : UIView

@property (nonatomic, weak) id<POAlertViewDelegate> delegate;


- (instancetype)initWithImage:(NSString *)imageName;

- (void)showView;

-(void)dismissAlertView;

@end
