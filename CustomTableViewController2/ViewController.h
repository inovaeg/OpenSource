//
//  ViewController.h
//  CustomTableViewController2
//
//  Created by Ahmed Taha on 11/5/11.
//  Copyright (c) 2011 Inova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollableTextField.h"

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    IBOutlet UITableView* tableView;
    CGFloat animatedDistance;
}
@end
