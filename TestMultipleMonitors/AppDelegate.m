//
//  AppDelegate.m
//  TestMultipleMonitors
//
//  Created by Ryan Briones on 05/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize webView = _webView;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSURL*url=[NSURL URLWithString:@"http://bost.ocks.org/mike/d3/workshop/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[_webView mainFrame] loadRequest: request];
    NSDate *rightNow = [NSDate date];
    NSLog(@"Got here...");
    NSLog(@"%@", [rightNow description]);
    NSLog(@"Screen: %d", [[[NSScreen mainScreen] deviceDescription] valueForKey: @"NSScreenNumber"]);
    NSArray *screens = [NSScreen screens];
    NSScreen *altScreen;
    for (id screen in screens) {
        NSLog(@"Screen: %d", [[screen deviceDescription] valueForKey: @"NSScreenNumber"]);
        if (screen != [NSScreen mainScreen]) {
            NSLog(@"Above is not main screen");
            altScreen = screen;
        }
    }

    [_window setFrame: [altScreen frame] display: YES];
}

@end