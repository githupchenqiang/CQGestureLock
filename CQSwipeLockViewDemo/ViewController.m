//
//  ViewController.m
//  CQSwipeLockViewDemo
//
//  Created by Qiang C on 15/2/12.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import "ViewController.h"
#import "CQSwipeLockView.h"
#import "CQInitSwipePasswordController.h"
#import "CQCheckToUnlockViewController.h"

@interface ViewController ()
@property (nonatomic, weak) UIButton *setButton;
@property (nonatomic, weak) UIButton *checkButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    label.text = @"hello world";
    CGFloat margin = 20.0f;
    CGFloat width = self.view.bounds.size.width - margin * 2;
        
    UIButton *setButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 60, width, 20)];
    [setButton setTitle:@"set gesture password" forState:UIControlStateNormal];
    [setButton addTarget:self action:@selector(setButtonBeTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setButton];
    
    UIButton *checkButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, width, 20)];
    [checkButton setTitle:@"check gesture password" forState:UIControlStateNormal];
    [checkButton addTarget:self action:@selector(checkButtonBeTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkButton];
    
    
}

-(void)setButtonBeTouched
{
    CQInitSwipePasswordController *controller = [CQInitSwipePasswordController new];
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)checkButtonBeTouched
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"gesturePassword"]) {
        CQCheckToUnlockViewController *controller = [CQCheckToUnlockViewController new];
        [self presentViewController:controller animated:YES completion:nil];
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Attention" message:@"no gesture password set" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
