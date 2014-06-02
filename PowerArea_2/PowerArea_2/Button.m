//
//  Button.m
//  PowerArea_2
//
//  Created by e125719 on 2014/06/02.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "Button.h"

@implementation Button

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 7.5f;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
