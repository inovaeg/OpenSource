//
//  ScrollableTextFieldDelegate.h
//  CustomTableViewController2
//
//  Created by Ahmed Taha on 11/5/11.
//  Copyright (c) 2011 Inova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Constants.h"

@interface ScrollableTextFieldDelegate : UIView <UITextFieldDelegate>
{
    id<UITextFieldDelegate> realDelegate;
    IBOutlet UITableView* mTableView;
    float originalTableHeight;
}
@property (nonatomic,retain) id<UITextFieldDelegate> realDelegate;
@end
