//
//  ScrollableTextFieldDelegate.m
//  CustomTableViewController2
//
//  Created by Ahmed Taha on 11/5/11.
//  Copyright (c) 2011 Inova. All rights reserved.
//

#import "ScrollableTextFieldDelegate.h"

static int shrinkedPortraitTableViewFrameHeight;

@implementation ScrollableTextFieldDelegate
@synthesize realDelegate;

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"%@ %@",[self class],NSStringFromSelector(_cmd));
    if([realDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)])
        [realDelegate textFieldDidBeginEditing:textField];
    
    UITableViewCell* tableViewCell = (UITableViewCell*)[textField superview];
    NSLog(@"%@",tableViewCell);
    

    UIWindow* window = [[[[UIApplication sharedApplication] keyWindow] subviews] lastObject];

    CGRect cellRect = [window convertRect:tableViewCell.bounds fromView:tableViewCell];
    NSLog(@"%f %f %f %f",cellRect.origin.x,cellRect.origin.y ,cellRect.size.width ,cellRect.size.height);
    if(mTableView == nil)
    {
        mTableView = [(UITableView*)[tableViewCell superview] retain];
        if(shrinkedPortraitTableViewFrameHeight == 0)
            shrinkedPortraitTableViewFrameHeight = mTableView.frame.size.height - PORTRAIT_KEYBOARD_HEIGHT;
    }
    NSLog(@"%@",mTableView);
    
    
    if(cellRect.origin.y + cellRect.size.height > 460 - PORTRAIT_KEYBOARD_HEIGHT)
        
    {
        NSIndexPath* indexPath = [mTableView indexPathForCell:tableViewCell];
        
        NSLog(@"scrolling / resize is needed");
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
        
        [mTableView setFrame:CGRectMake(mTableView.frame.origin.x, mTableView.frame.origin.y,mTableView.frame.size.width,shrinkedPortraitTableViewFrameHeight)];
        [mTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        
        [UIView commitAnimations];
        
        

        //[tableViewCell setSelected:YES];
        //[tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionBottom animated:YES];
        
    }
    else
    {
        NSLog(@"resize is needed");
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
        [mTableView setFrame:CGRectMake(mTableView.frame.origin.x, mTableView.frame.origin.y, mTableView.frame.size.width, shrinkedPortraitTableViewFrameHeight)];
        [UIView commitAnimations];

    }
    
    
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"%@ %@",[self class],NSStringFromSelector(_cmd));
    if([realDelegate respondsToSelector:@selector(textFieldDidEndEditing:)])
     [realDelegate textFieldDidEndEditing:textField];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"%@ %@",[self class],NSStringFromSelector(_cmd));
    if([realDelegate respondsToSelector:@selector(textFieldShouldBeginEditing:)])
     return [realDelegate textFieldShouldBeginEditing:textField];
     
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    NSLog(@"%@ %@",[self class],NSStringFromSelector(_cmd));
     if([realDelegate respondsToSelector:@selector(textFieldShouldClear:)])
     return [realDelegate textFieldShouldClear:textField];
    
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"%@ %@",[self class],NSStringFromSelector(_cmd));
     if([realDelegate respondsToSelector:@selector(textFieldShouldEndEditing:)])
     return [realDelegate textFieldShouldEndEditing:textField];
    
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%@ %@",[self class],NSStringFromSelector(_cmd));
    if([realDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)])
        return [realDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"%@ %@",[self class],NSStringFromSelector(_cmd));
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [mTableView setFrame:CGRectMake(mTableView.frame.origin.x, mTableView.frame.origin.y, mTableView.frame.size.width, shrinkedPortraitTableViewFrameHeight + PORTRAIT_KEYBOARD_HEIGHT)];
    [UIView commitAnimations];
     if([realDelegate respondsToSelector:@selector(textFieldShouldReturn:)])
         return [realDelegate textFieldShouldReturn:textField];
    
    return YES;
    
}

-(void)dealloc{
    [mTableView release];
    [super dealloc];
}

@end
