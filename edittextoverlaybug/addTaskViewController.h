//
//  addTaskViewController.h
//  TurnRight
//
//  Created by Bob Phillips on 8/20/14.
//  Copyright (c) 2014 TurnRight Advice Solutions, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol addTaskViewControllerDelegate
-(void)shouldAcceptTextChanges;
-(void)shouldDismissTextChanges;
@end
@interface addTaskViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, strong) id delegate;
@property (nonatomic) NSInteger irow;
-(void)showCustomTextInputViewInView:(UIView *)targetView
                            withText:(NSString *)text
                        andWithTitle:(NSString *)title;
-(void)closeTextInputView;
-(NSString *)getText;

@end
