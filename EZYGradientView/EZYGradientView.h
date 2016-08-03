// EZYGradientView.h
//
// Copyright (c) 2016 Shashank Pali
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface EZYGradientView : UIView

/**
 *  First color of gradient i.e. it appears on top when angleº set to 0.0.
 */
@property (strong, nonatomic) IBInspectable UIColor *firstColor;
/**
 *  Second color of gradient i.e. it appears in bottom when angleº set to 0.0.
 */
@property (strong, nonatomic) IBInspectable UIColor *secondColor;
/**
 *  Angleº will describe the tilt of gradient.
 */
@property (assign, nonatomic) IBInspectable CGFloat angleº;
/**
 *  Color ratio will describe the proportion of colors. Its value ranges from 0.0 to 1.0 default is 0.5.
 */
@property (assign, nonatomic) IBInspectable CGFloat colorRatio;
/**
 *  Fade intensity will describe the disperse of colors. Its value ranges from 0.0 to 1.0 default is 0.0.
 */
@property (assign, nonatomic) IBInspectable CGFloat fadeIntensity;
/**
 *  Is blur allows to add visual effect on gradient view. Can't be changed during run-time.
 */
@property (assign, nonatomic) IBInspectable BOOL isBlur;
/**
 *  Blur opacity will describe the transparency of blur. Its value ranges from 0.0 to 1.0 default is 0.0. It is suggested to set EZYGradientView background color as clear color for better results.
 */
@property (assign, nonatomic) IBInspectable CGFloat blurOpacity;

@end
