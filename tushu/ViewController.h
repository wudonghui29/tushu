//
//  ViewController.h
//  tushu
//
//  Created by Faith on 15-4-30.
//  Copyright (c) 2015年 Faith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userNumberField;
@property (weak, nonatomic) IBOutlet UITextField *passWField;
- (IBAction)loginAction:(id)sender;

- (IBAction)registerAction:(id)sender;
@end

