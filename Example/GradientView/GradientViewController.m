//
//  ViewController.m
//  GradientView
//
//  Created by Shashank Pali on 25/07/16.
//  Copyright © 2016 Shashank. All rights reserved.
//

#import "GradientViewController.h"
#import "EZYGradientView.h"

@interface GradientViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation GradientViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  _table.contentInset = UIEdgeInsetsMake(44, 0, 49, 0);
  _table.scrollIndicatorInsets = _table.contentInset;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 10;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  return @(section).stringValue;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  
  EZYGradientView *cellView = (EZYGradientView *)[cell viewWithTag:10];
  cellView.firstColor = [UIColor colorWithRed:[self colorCode] green:[self colorCode] blue:[self colorCode] alpha:1];
  cellView.secondColor = [UIColor colorWithRed:[self colorCode] green:[self colorCode] blue:[self colorCode] alpha:1];
  cellView.angleº = [self colorCode] * 30;
  cellView.colorRatio = 0.5;
  cellView.fadeIntensity = 1;
  
  return  cell;
}

- (CGFloat)colorCode
{
  CGFloat colorNumber = (arc4random()%255) / 255.0 ;
  return colorNumber;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
