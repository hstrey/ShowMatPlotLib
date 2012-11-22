//
//  SMPLAppDelegate.h
//  ShowMatPlotLib
//
//  Created by Helmut Strey on 4/23/12.
//  Copyright (c) 2012 Stony Brook University. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SMPLImageView.h"

@interface SMPLAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet SMPLImageView *matplotlibView;
@property (nonatomic) double freq;

- (void)pythonOut: (NSString*)string;

@end
