//
//  goodText.m
//  PowerSpot
//
//  Created by e125719 on 2014/05/24.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "goodText.h"

@implementation goodText

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
    NSDictionary* attrs = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16], NSFontAttributeName, nil];
    
    [self setColor_r:0 g:0 b:0];
    
    [self drawString:[NSString stringWithFormat:@"どんないいことがあった？"] x:60 y:160 attrs:attrs];
}

@end
