//
//  ViewController.m
//  CustomTableViewController2
//
//  Created by Ahmed Taha on 11/5/11.
//  Copyright (c) 2011 Inova. All rights reserved.
//

#import "ViewController.h"



@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    ScrollableTextField* textField = [[ScrollableTextField alloc] initWithFrame:CGRectMake(5, 2, 310, 40)];
   // textField.backgroundColor = [UIColor redColor];
    textField.borderStyle = UITextBorderStyleBezel;
    textField.delegate = self;
    textField.tag = indexPath.row;
    [cell addSubview:textField];
    textField.text = [NSString stringWithFormat:@"%d %d",indexPath.section,indexPath.row];
    
    return cell;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%@ %@",[self class],NSStringFromSelector(_cmd));
    if([string characterAtIndex:0] == 10)
    {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
}


@end
