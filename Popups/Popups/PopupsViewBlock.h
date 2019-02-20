//
//  PopupsView.h
//  Popups
//
//  Created by Arthur on 2018/5/30.
//  Copyright © 2018年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CancelBlock)(NSString *imageName);

@interface PopupsViewBlock : UIView


@property (nonatomic, strong) CancelBlock block;

- (instancetype)initWithImage:(NSString *)imageName;

- (void)showView;

-(void)dismissAlertView;

@end
