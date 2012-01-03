//
//  ScrollableTextField.m
//  CustomTableViewController2
//
//  Created by Ahmed Taha on 11/5/11.
//  Copyright (c) 2011 Inova. All rights reserved.
//

#import "ScrollableTextField.h"



@implementation ScrollableTextField

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        scrollableTextFieldDelegate = [[ScrollableTextFieldDelegate alloc] init];
        super.delegate = scrollableTextFieldDelegate;
    }
    return self;
}


-(void)setDelegate:(id<UITextFieldDelegate>)delegate{
    scrollableTextFieldDelegate.realDelegate  = delegate;
}
@end
