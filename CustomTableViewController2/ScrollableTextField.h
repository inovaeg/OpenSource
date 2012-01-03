//
//  ScrollableTextField.h
//  CustomTableViewController2
//
//  Created by Ahmed Taha on 11/5/11.
//  Copyright (c) 2011 Inova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollableTextFieldDelegate.h"

@interface ScrollableTextField : UITextField <UITextFieldDelegate>{
    
    ScrollableTextFieldDelegate* scrollableTextFieldDelegate;
}



@end
