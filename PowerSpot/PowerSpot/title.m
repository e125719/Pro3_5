//
//  title.m
//  PowerSpot
//
//  Created by e125719 on 2014/05/20.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "title.h"

@implementation title

- (void)setColor_r:(int)r g:(int)g b:(int)b {
    [[UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f] set];
}

- (void)drawString:(NSString*)string x:(float)x y:(float)y attrs:(NSDictionary*)attrs {
    [string drawAtPoint:CGPointMake(x, y) withAttributes:attrs];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSDictionary* attrs = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:40], NSFontAttributeName, nil];
    
    [self setColor_r:0 g:0 b:0];
    
    [self drawString:[NSString stringWithFormat:@"PowerSpot"] x:60 y:160 attrs:attrs];
}

- (UIButton*)makeButton:(CGRect)rect text:(NSString*)text {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:rect];
    [button setTitle:text forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end