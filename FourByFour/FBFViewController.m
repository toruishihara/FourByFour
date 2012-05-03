//
//  FBFViewController.m
//  FourByFour
//
//  Created by 1 torui on 12/05/02.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FBFViewController.h"

@interface FBFViewController ()

@end

@implementation FBFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
