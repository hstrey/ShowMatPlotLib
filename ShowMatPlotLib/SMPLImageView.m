//
//  SMPLImageView.m
//  ShowMatPlotLib
//
//  Created by Helmut Strey on 4/23/12.
//  Copyright (c) 2012 Stony Brook University. All rights reserved.
//

#import "SMPLImageView.h"
#import "Cocoa/Cocoa.h"
#import "AppKit/NSImage.h"

@implementation SMPLImageView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    NSLog(@"drawRect called");
    [super drawRect:dirtyRect];
}

@end
