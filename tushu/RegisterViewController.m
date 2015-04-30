//
//  RegisterViewController.m
//  图书管书籍借阅系统
//
//  Created by Faith on 15-4-30.
//  Copyright (c) 2015年 Faith. All rights reserved.
//

#import "RegisterViewController.h"
#import "User.h"
#import "Book.h"
#import "AppDelegate.h"

@interface RegisterViewController ()
{
    UIAlertView *alertView;
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerBtnClicked:(id)sender
{
    [self.passWordField resignFirstResponder];
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    //创建Student对象
    User *user = [[User alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    user.name = self.userNameField.text;
    user.number = self.userNumberField.text;
    user.passW = self.passWordField.text;
    //保存Student对象
    [context insertObject:user];
//    [context save:nil];
    if([context save:nil])
    {
        alertView = [[UIAlertView alloc] initWithTitle:nil message:@"注册成功" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [NSTimer scheduledTimerWithTimeInterval:2.4f
                                         target:self
                                       selector:@selector(dismissAlertView:)
                                       userInfo:nil
                                        repeats:NO];
        
        [alertView show];
    }

}
- (void)dismissAlertView:(NSTimer*)timer {
    NSLog(@"Dismiss alert view");
    
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}


@end
