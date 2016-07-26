//
//  CQSwipeLockView.h
//  CQSwipeLockViewDemo
//
//  Created by Qiang C on 15/2/12.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#define LIGHTBLUE [UIColor colorWithRed:0 green:170/255.0 blue:1 alpha:1]

typedef NS_ENUM(NSUInteger, CQSwipeLockViewState) {
    CQSwipeLockViewStateNormal,
    CQSwipeLockViewStateWarning,
    CQSwipeLockViewStateSelected
};
@protocol CQSwipeLockViewDelegate;

@interface CQSwipeLockView : UIView
@property (nonatomic, weak) id<CQSwipeLockViewDelegate> delegate;
@end


@protocol CQSwipeLockViewDelegate<NSObject>
@optional
-(CQSwipeLockViewState)swipeView:(CQSwipeLockView *)swipeView didEndSwipeWithPassword:(NSString *)password;
@end