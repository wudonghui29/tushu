//
//  RegisterViewController.h
//  图书管书籍借阅系统
//
//  Created by Faith on 15-4-30.
//  Copyright (c) 2015年 Faith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *userNumberField;
@property (weak, nonatomic) IBOutlet UITextField *passWordField;

- (IBAction)registerBtnClicked:(id)sender;

@end
