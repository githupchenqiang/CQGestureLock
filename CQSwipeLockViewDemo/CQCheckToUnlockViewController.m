//
//  CQCheckToUnlockViewController.m
//  CQSwipeLockViewDemo
//
//  Created by Qiang C on 15/2/28.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import "CQCheckToUnlockViewController.h"
#import "CQSwipeLockView.h"
@interface CQCheckToUnlockViewController ()<CQSwipeLockViewDelegate>
@property (nonatomic, weak) CQSwipeLockView *lockView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic) NSUInteger unmatchCounter;
@property (nonatomic, weak) UILabel *counterLabel;
@end

@implementation CQCheckToUnlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:35/255.0 green:39/255.0 blue:54/255.0 alpha:1];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"swipe to unlock";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.frame = CGRectMake(10, 60, self.view.bounds.size.width - 20, 20);
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *counterLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, self.view.bounds.size.width - 20, 20)];
    counterLabel.textColor = [UIColor redColor];
    counterLabel.textAlignment = NSTextAlignmentCenter;
    counterLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:counterLabel];
    self.counterLabel = counterLabel;
    self.counterLabel.hidden = YES;
    
    
    CGFloat viewWidth = self.view.bounds.size.width - 40;
    CGFloat viewHeight = viewWidth;
    
    CQSwipeLockView *lockView = [[CQSwipeLockView alloc] initWithFrame:CGRectMake(20, self.view.bounds.size.height - viewHeight - 40 - 100, viewWidth, viewHeight)];
    [self.view addSubview:lockView];
    
    self.lockView = lockView;
    self.lockView.delegate = self;
    
    self.unmatchCounter = 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(CQSwipeLockViewState)swipeView:(CQSwipeLockView *)swipeView didEndSwipeWithPassword:(NSString *)password
{
    NSString *savedPassword = [[NSUserDefaults standardUserDefaults] objectForKey:@"gesturePassword"];
    if ([savedPassword isEqualToString:password]) {
        [self dismiss];
        return CQSwipeLockViewStateNormal;
    }else{
        self.unmatchCounter--;
        if (self.unmatchCounter == 0) {
            self.counterLabel.text = @"5 times unmatched";
            self.counterLabel.hidden = NO;
            
            [self performSelector:@selector(dismiss) withObject:nil afterDelay:1];
            
        }else {
            self.counterLabel.text = [NSString stringWithFormat:@"unmatched, %lu times left", (unsigned long)self.unmatchCounter];
            self.counterLabel.hidden = NO;
        }
        return CQSwipeLockViewStateWarning;
    }
}

-(void)dismiss{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
