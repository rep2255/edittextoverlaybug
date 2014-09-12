//
//  taskViewController.h
//  TurnRight
//
//  Created by Bob Phillips on 8/18/14.
//  Copyright (c) 2014 TurnRight Advice Solutions, Inc. All rights reserved.
//


#import "addTaskViewController.h"
@class addTaskViewController;
@interface taskViewController : UITableViewController <UIGestureRecognizerDelegate,UITableViewDataSource,UITableViewDelegate,addTaskViewControllerDelegate>
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil ;
@property (nonatomic,strong) addTaskViewController* taskInputController;
@property (strong, nonatomic)NSMutableArray* tasks;
@end
