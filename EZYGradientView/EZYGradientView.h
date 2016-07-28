//
//  blurView.h
//  testing
//
//  Created by ABS_MAC01 on 25/07/16.
//  Copyright © 2016 Shashank. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface EZYGradientView : UIView

@property (strong, nonatomic) IBInspectable UIColor *firstColor;
@property (strong, nonatomic) IBInspectable UIColor *secondColor;
@property (assign, nonatomic) IBInspectable CGFloat angleº;
@property (assign, nonatomic) IBInspectable CGFloat colorRatio;
@property (assign, nonatomic) IBInspectable CGFloat fadeIntensity;
@property (assign, nonatomic) IBInspectable BOOL blur;
@property (assign, nonatomic) IBInspectable CGFloat blurOpacity;

@end
