//
//  taskViewController.m
//  TurnRight
//
//  Created by Bob Phillips on 8/18/14.
//  Copyright (c) 2014 TurnRight Advice Solutions, Inc. All rights reserved.
//

#import "taskViewController.h"



@interface taskViewController (){
    BOOL isEditingItem;
}
@property (nonatomic, strong) addTaskViewController *textInput;
@property (weak,nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSMutableDictionary *offscreenCells;
@end

@implementation taskViewController

@synthesize tasks;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        tasks=[[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    isEditingItem=NO;
    // Do any additional setup after loading the view from its nib.
    [self createView];
    // Initialize the custom text input object.
    _textInput = [[addTaskViewController alloc] init];
    [_textInput setDelegate:self];
    [_table setDelegate:self];
    [_table setDataSource:self];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Creates  page view
-(void)createView{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self addTaskView];
    }


-(void) addTaskView {
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    //
    // iterates through the list of feeds and adds them to the list
    self.tasks = [NSMutableArray arrayWithObjects:@"Task 1",@"Task 2",@"Task 3",nil];
    /*
    for(NSDictionary*task in aTasks){
        //NSLog(@"task:%@",task);
        [tasks addObject:task];
    }
     */
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStylePlain];
    [tableView setAutoresizesSubviews:YES];
    [tableView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    //tableView.estimatedRowHeight=300.0f;
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    _table=tableView;
    [self.view addSubview:tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tasks count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Set the number of sections inside the tableview. We need only one section.
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"SettingsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
   
    if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
            cell.textLabel.numberOfLines=0;
       }
    NSString *desc = [self.tasks objectAtIndex:indexPath.row];
    [cell.textLabel setText:desc];
    return cell;
}

- (void)addTask {
    [_textInput showCustomTextInputViewInView:self.view
                                     withText:@""
                                 andWithTitle:@"Add new item"];
}
-(void)shouldAcceptTextChanges{
    // Add the new item to the sampleDataArray.
    //[_sampleDataArray addObject:[_textInput getText]];
    
    // Reload the table using animation.
    //[_table reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    NSUInteger index = _textInput.irow;
    //NSLog(@"Description:%@,row:%lu",[_textInput getText],(unsigned long)index);
    
    if (!isEditingItem) {
        // Add the new item to the tasks.
        [tasks addObject:[_textInput getText]];
    }
    else{
        // Replace the selected item into the array with the updated value.
        [tasks replaceObjectAtIndex:index withObject:[_textInput getText]];
        // Set the isEditingItem flag to NO.
        isEditingItem = NO;
    }
    
    // Reload the table using animation.
    [_table reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    [_textInput closeTextInputView];
}

-(void)shouldDismissTextChanges{
    [_textInput closeTextInputView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* desc=[tasks objectAtIndex:[indexPath row]];
        [_textInput showCustomTextInputViewInView:self.view
                                         withText:desc
                                     andWithTitle:@"Edit item"];
        _textInput.irow=[indexPath row];
        
        // Set the isEditingItem flag value to YES, indicating that
        // we are editing an item.
        isEditingItem = YES;
}




@end
