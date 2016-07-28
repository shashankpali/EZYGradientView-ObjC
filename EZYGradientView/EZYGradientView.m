//
//  blurView.m
//  testing
//
//  Created by ABS_MAC01 on 25/07/16.
//  Copyright © 2016 Shashank. All rights reserved.
//

#import "EZYGradientView.h"

struct EZYPoints
{
  CGPoint start;
  CGPoint end;
};

struct EZYPoints EZYPointsMake(CGPoint start, CGPoint end)
{
  struct EZYPoints e;
  e.start = start;
  e.end = end;
  return e;
}

struct EZYLocations
{
  CGFloat firstColor;
  CGFloat secondColor;
};

struct EZYLocations EZYLocationsMake(CGFloat firstColor, CGFloat secondColor)
{
  struct EZYLocations l;
  l.firstColor = firstColor;
  l.secondColor = secondColor;
  return l;
}

@interface EZYGradientView ()

@property (strong, nonatomic) CAGradientLayer *gradientLayer;
@property (strong, nonatomic) UIVisualEffectView *blurView;

@end

@implementation EZYGradientView

#pragma mark - Designated Initializer

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self)
  {
    [self defaultValueToProperties];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self)
  {
    [self defaultValueToProperties];
  }
  return self;
}

#pragma mark - Draw Rect

- (void)drawRect:(CGRect)rect
{
  if (_gradientLayer == nil)
  {
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.frame = self.bounds;
    [self.layer insertSublayer:_gradientLayer atIndex:0];
  }
  _gradientLayer.colors = @[(id)_firstColor.CGColor, (id)_secondColor.CGColor];
  struct EZYPoints points = [self startEndPoints];
  _gradientLayer.startPoint = points.start;
  _gradientLayer.endPoint = points.end;
  struct EZYLocations locations = [self locations];
  _gradientLayer.locations = @[@(locations.firstColor), @(locations.secondColor)];
  _blurView = nil;
  if (_blur)
  {
    _gradientLayer.colors = @[(id)[self blurColor:_firstColor], (id)[self blurColor:_secondColor]];
    [self insertSubview:self.blurView atIndex:0];
  }
}

#pragma mark - Default Value

- (void)defaultValueToProperties
{
  _firstColor = [UIColor whiteColor];
  _secondColor = [UIColor whiteColor];
  self.angleº = 0;
  _colorRatio = 0.5;
  _fadeIntensity = 0;
  _blur = NO;
  _blurOpacity = 0;
}

#pragma mark - Helper

- (CGColorRef)blurColor:(UIColor *)color
{
  return [color colorWithAlphaComponent:0.9 - (_blurOpacity / 2)].CGColor;
}

- (struct EZYPoints)startEndPoints
{
  CGFloat rotCalX = 0.0, rotCalY = 0.0;
  CGFloat rotate = _angleº / 90;
  
  if (rotate <= 1)
  {
    rotCalY = rotate;
  }
  else if (rotate <= 2)
  {
    rotCalY = 1;
    rotCalX = rotate - 1;
  }
  else if (rotate <= 3)
  {
    rotCalX = 1;
    rotCalY = 1 - (rotate - 2);
  }
  else if (rotate <= 4)
  {
    rotCalX = 1 - (rotate - 3);
  }
  
  CGPoint start = CGPointMake(1 - rotCalY, 0 + rotCalX);
  CGPoint end = CGPointMake(0 + rotCalY, 1 - rotCalX);
  
  return EZYPointsMake(start, end);
}

- (struct EZYLocations)locations
{
  CGFloat divider = _fadeIntensity / [self divider];
  return EZYLocationsMake(_colorRatio - divider, _colorRatio + divider);
}

- (CGFloat)divider
{
  if (_colorRatio == 0.1)
  {
    return 10;
  }
  if (_colorRatio < 0.5)
  {
    CGFloat value = 0.5 - _colorRatio + 0.5;
    return 1 / (1 - value);
  }
  return 1 / (1 - _colorRatio);
}

#pragma mark - Properties

- (void)setAngleº:(CGFloat)angleº
{
  _angleº = angleº;
  
  // handle negative angleºs
  if (_angleº < 0.0)
  {
    _angleº = 360.0 + _angleº;
  }
  
  // offset of 45 is needed to make logic work
  _angleº = _angleº + 45;
  
  NSInteger multiplier = _angleº / 360;
  if (multiplier > 0)
  {
    _angleº = _angleº - 360 * multiplier;
  }
}

- (UIVisualEffectView *)blurView
{
  if (_blurView == nil)
  {
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    _blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    _blurView.frame = self.bounds;
    
    return _blurView;
  }
  return _blurView;
}

@end
