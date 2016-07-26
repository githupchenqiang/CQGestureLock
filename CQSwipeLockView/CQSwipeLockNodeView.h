//
//  CQSwipeLockNodeView.h
//  CQSwipeLockViewDemo
//
//  Created by Qiang C on 15/2/12.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, CQSwipeLockNodeViewStatus) {
    CQSwipeLockNodeViewStatusNormal,
    CQSwipeLockNodeViewStatusSelected,
    CQSwipeLockNodeViewStatusWarning
};

@interface CQSwipeLockNodeView : UIView
@property (nonatomic) CQSwipeLockNodeViewStatus nodeViewStatus;

@end
