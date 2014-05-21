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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSDictionary* attrs = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:24], NSFontAttributeName, nil];
    
    [self setColor_r:0 g:0 b:0];
    
    [self drawString:[NSString stringWithFormat:@"画面サイズ%dx%d", (int)[UIScreen mainScreen].bounds.size.width, (int)[UIScreen mainScreen].bounds.size.height] x:0 y:20 attrs:attrs];

    CGSize size = [@"A" sizeWithAttributes:attrs];
    [self drawString:[NSString stringWithFormat:@"文字幅:%d", (int)size.width] x:0 y:20+26 attrs:attrs];
    
    attrs = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12], NSFontAttributeName, nil];
    [self setColor_r:255 g:0 b:0];
    [self drawString:@"12pt" x:0 y:20+26*2 attrs:attrs];
    
    attrs = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16], NSFontAttributeName, nil];
    [self setColor_r:0 g:255 b:0];
    [self drawString:@"16pt" x:0 y:20+26*3 attrs:attrs];
    
    attrs = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:24], NSFontAttributeName, nil];
    [self setColor_r:0 g:0 b:255];
    [self drawString:@"24pt" x:0 y:20+26*4 attrs:attrs];
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
