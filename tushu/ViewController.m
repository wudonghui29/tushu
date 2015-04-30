//
//  ViewController.m
//  tushu
//
//  Created by Faith on 15-4-30.
//  Copyright (c) 2015年 Faith. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "User.h"
#import "Book.h"
#import "RegisterViewController.h"
#import "ModelViewController.h"

@interface ViewController ()
{
    UIAlertView *alertView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Path:%@",NSHomeDirectory());
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    NSManagedObjectContext *context = appDelegate.managedObjectContext;
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
//        //创建Student对象
//    User *user = [[User alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
//    
//
//    int r = arc4random_uniform(1000);
//
//    user.name = [NSString stringWithFormat:@"Zhangsan: %d", r];
//   
//    
//    
    NSEntityDescription *bEntity = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:context];
//
//    //创建Book对象
//
    NSArray *bookNameArray = @[@"ios开发指南",@"Objective-c语言",@"JAVA语言"];
    NSArray *bookNumberArray = @[@"001",@"002",@"003"];
    NSArray *bookStateArray = @[@"0",@"1",@"1"];
    NSArray *bookBriefArray = @[@"本书介绍iOS开发基础知识",@"本书介绍bjective-c语言",@"本书介绍AVA语言"];
    for(int i = 0; i<bookNameArray.count;i++)
    {
        Book *book = [[Book alloc] initWithEntity:bEntity insertIntoManagedObjectContext:context];
        
        book.name = bookNameArray[i];
        book.number = bookNumberArray[i];
        NSInteger stateInt = [bookStateArray[i] integerValue];
        book.state = [NSNumber numberWithInteger:stateInt];
        book.brief = bookBriefArray[i];
        [context save:nil];

    }
    Book *book = [[Book alloc] initWithEntity:bEntity insertIntoManagedObjectContext:context];
    
    book.name = @"红楼梦";
    book.number = @"123";
    book.state = [NSNumber numberWithInt:1];
    book.brief = @"";
    //添加Book对象
//
//    //保存Student对象
//    [context insertObject:user];
//    [context save:nil];
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
//
//    NSArray *arr = [context executeFetchRequest:request error:nil];
//    for (User *user in arr) {
//
//        NSLog(@"Name: %@", user.name);
//
//        for (Book *b in user.books) {
//        
//            NSLog(@"Book: %@ -> %@", b.name, b.owner);
//        
//        }
//
//    }

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.managedObjectContext;

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSArray *arr = [context executeFetchRequest:request error:nil];
        for (User *user in arr)
        {
    
            NSString *nameStr = user.number;
            NSString *passWStr = user.passW;
            if(![nameStr isEqualToString:self.userNumberField.text])
            {
                alertView = [[UIAlertView alloc] initWithTitle:nil message:@"用户名或密码错误，请重新输入" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [NSTimer scheduledTimerWithTimeInterval:2.4f
                                                 target:self
                                               selector:@selector(dismissAlertView:)
                                               userInfo:nil
                                                repeats:NO];
                
                [alertView show];

            }
            else if(![passWStr isEqualToString:self.passWField.text])
            {
                alertView = [[UIAlertView alloc] initWithTitle:nil message:@"用户名或密码错误，请重新输入" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [NSTimer scheduledTimerWithTimeInterval:2.4f
                                                 target:self
                                               selector:@selector(dismissAlertView:)
                                               userInfo:nil
                                                repeats:NO];
                
                [alertView show];

            }
            else
            {
                alertView = [[UIAlertView alloc] initWithTitle:nil message:@"登录成功" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                [NSTimer scheduledTimerWithTimeInterval:2.4f
                                                 target:self
                                               selector:@selector(dismissAlertView:)
                                               userInfo:nil
                                                repeats:NO];
                
                [alertView show];
                ModelViewController *vc = [[ModelViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                

            }
    
        }
    
    


}
- (void)dismissAlertView:(NSTimer*)timer {
    NSLog(@"Dismiss alert view");
    
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}



- (IBAction)registerAction:(id)sender
{
    RegisterViewController *vc = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];

}
@end
